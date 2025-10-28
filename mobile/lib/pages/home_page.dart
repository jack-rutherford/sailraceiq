import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Upcoming Regattas';
  List<String> regattas = [];

  // Mock API call
  Future<List<String>> fetchRegattas(String type) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    // Mock JSON response
    const jsonResponse = '''
    {
      "upcoming": ["Cedarfest", "Emma B. Memorial Regatta", "Fall Fury"],
      "past": ["Spring Sprint", "Lake Challenge", "Summer Showdown"]
    }
    ''';

    final data = json.decode(jsonResponse);
    if (type == 'Upcoming Regattas') {
      return List<String>.from(data['upcoming']);
    } else {
      return List<String>.from(data['past']);
    }
  }

  // Get current season based on month
  String getCurrentSeason() {
    final month = DateTime.now().month;
    if (month >= 3 && month <= 5) return 'Spring';
    if (month >= 6 && month <= 8) return 'Summer';
    if (month >= 9 && month <= 11) return 'Fall';
    return 'Winter';
  }

  @override
  void initState() {
    super.initState();
    _loadRegattas();
  }

  void _loadRegattas() async {
    final items = await fetchRegattas(dropdownValue);
    setState(() {
      regattas = items;
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
                      children:
                          regattas.map((r) => _buildRegattaItem(context, r)).toList(),
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