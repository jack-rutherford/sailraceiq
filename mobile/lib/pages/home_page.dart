import 'package:flutter/material.dart';
import 'package:mobile/models/regatta_model.dart';
import 'package:mobile/pages/regatta_page.dart';
import 'dart:async';
import 'package:mobile/util/helpers.dart';
import 'package:mobile/util/mock_api.dart';
import 'package:mobile/widgets/build_appbar.dart';
import 'package:mobile/widgets/default_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Upcoming Regattas';
  List<Regatta> upcomingRegattas = [];
  List<Regatta> pastRegattas = [];
  List<Regatta> regattas = [];

  // Fetch regattas using MockApi
  Future<void> fetchRegattas() async {
    final data = await MockApi().fetchRegattaList();
    List<dynamic> regattasData = data['regattas'];

    regattasData.sort((a, b) {
      DateTime dateA = DateTime.parse(a['start_date']);
      DateTime dateB = DateTime.parse(b['start_date']);
      return dateA.compareTo(dateB);
    });

    final now = DateTime.now();

    upcomingRegattas = [];
    pastRegattas = [];

    for (var regatta in regattasData) {
      DateTime startDate = DateTime.parse(regatta['start_date']);
      if (startDate.isAfter(now) || startDate.isAtSameMomentAs(now)) {
        upcomingRegattas.add(Regatta.fromJson(regatta));
      } else {
        pastRegattas.add(Regatta.fromJson(regatta));
      }
    }
    // Reverse pastRegattas so most recent is first
    pastRegattas = pastRegattas.reversed.toList();
  }

  @override
  void initState() {
    super.initState();
    _loadRegattas();
  }

  void _loadRegattas() async {
    if (upcomingRegattas.isEmpty && pastRegattas.isEmpty) {
      await fetchRegattas();
    }
    setState(() {
      if (dropdownValue == 'Upcoming Regattas') {
        regattas = upcomingRegattas;
      } else {
        regattas = pastRegattas;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final season = getCurrentSeason();
    final year = DateTime.now().year;

    return Scaffold(
      appBar: BuildAppBar(
          title: 'SailraceIQ',
          onThemeToggle: () {
            final themeNotifier =
                Provider.of<ThemeNotifier>(context, listen: false);
            themeNotifier.toggleTheme();
          }),
      drawer: DefaultDrawer(onThemeToggle: () {
        final themeNotifier =
            Provider.of<ThemeNotifier>(context, listen: false);
        themeNotifier.toggleTheme();
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Text(
                '$season $year',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 24),
            // Dropdown header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(
                        value: 'Upcoming Regattas',
                        child: Text('Upcoming Regattas')),
                    DropdownMenuItem(
                        value: 'Past Regattas', child: Text('Past Regattas')),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      regattas = []; // clear previous list
                    });
                    _loadRegattas();
                  },
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Regatta List
            Expanded(
              child: regattas.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: regattas
                          .map((r) => _buildRegattaItem(context, r))
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegattaItem(BuildContext context, Regatta regatta) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RegattaPage(regatta: regatta))),
        borderRadius: BorderRadius.circular(4.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              const Icon(Icons.sailing, size: 20),
              const SizedBox(width: 12),
              Text(
                regatta.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
