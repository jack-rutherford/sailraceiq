import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:mobile/util/helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Upcoming Regattas';
  List<String> upcomingRegattas = [];
  List<String> pastRegattas = [];
  List<String> regattas = [];

  // Mock API call
  Future<void> fetchRegattas() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    // Mock JSON response
    const jsonResponse = '''
    {
      "regattas": [
        {
          "id": 1,
          "name": "Cedarfest",
          "start_date": "2025-11-10"
        },
        {
          "id": 2,
          "name": "Emma B. Memorial Regatta",
          "start_date": "2025-11-17"
        },
        {
          "id": 3,
          "name": "Fall Fury",
          "start_date": "2025-12-01"
        },
        {
          "id": 4,
          "name": "Spring Sprint",
          "start_date": "2025-03-21"
        },
        {
          "id": 5,
          "name": "Lake Challenge",
          "start_date": "2025-04-05"
        },
        {
          "id": 6,
          "name": "Summer Showdown",
          "start_date": "2025-07-12"
        }
      ]
    }
    ''';

    final data = json.decode(jsonResponse);
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
        upcomingRegattas.add(regatta['name']);
      } else {
        pastRegattas.add(regatta['name']);
      }
    }
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

  Widget _buildRegattaItem(BuildContext context, String title) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(4.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              const Icon(Icons.sailing, size: 20),
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
