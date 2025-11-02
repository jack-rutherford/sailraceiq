import 'package:flutter/material.dart';
import 'package:mobile/models/regatta_model.dart';

class RegattaPage extends StatefulWidget {
  const RegattaPage({super.key});

  @override
  _RegattaPageState createState() => _RegattaPageState();
}

class _RegattaPageState extends State<RegattaPage> {
  String _selectedFleet = 'Overall';

  @override
  Widget build(BuildContext context) {
    final regatta = ModalRoute.of(context)!.settings.arguments as Regatta;

    return Scaffold(
      appBar: AppBar(
        title: Text(regatta.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                regatta.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            _buildField('Start Date', '${regatta.startDate.toLocal()}'.split(' ')[0]),
            _buildField('Duration', '2 days'),
            _buildField('Report Time', 'TBD'),
            _buildField('Venue', 'TBD'),
            const SizedBox(height: 16),
            _buildField('Type', 'TBD'),
            _buildField('Participation', 'TBD'),
            _buildField('Scoring', 'TBD'),
            _buildField('Host', 'TBD'),
            const SizedBox(height: 24),
            const Text('Regatta Files', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Card(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(title: Text('NOR')),
                  ListTile(title: Text('SI')),
                  ListTile(title: Text('SI Amendment #1')),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Scores', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Icon(Icons.show_chart, size: 64, color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRadio('A Fleet'),
                      _buildRadio('B Fleet'),
                      _buildRadio('Overall'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildRadio(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: label,
          groupValue: _selectedFleet,
          onChanged: (value) {
            setState(() {
              _selectedFleet = value!;
            });
          },
        ),
        Text(label),
      ],
    );
  }
}
