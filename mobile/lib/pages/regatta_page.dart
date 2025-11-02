import 'package:flutter/material.dart';
import 'package:mobile/models/regatta_model.dart';

class RegattaPage extends StatefulWidget {
  final Regatta regatta;

  const RegattaPage({super.key, required this.regatta});

  @override
  _RegattaPageState createState() => _RegattaPageState();
}

class _RegattaPageState extends State<RegattaPage> {
  String _selectedFleet = 'Overall';
  String? _selectedFile;

  @override
  Widget build(BuildContext context) {
    final regatta = widget.regatta;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(regatta.name),
      // ),
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
            _buildField('Duration', regatta.duration.toString()),
            _buildField('Report Time', regatta.reportTime),
            _buildField('Venue', regatta.venue),
            // const SizedBox(height: 16),
            _buildField('Type', regatta.type),
            _buildField('Participation', regatta.participation),
            _buildField('Scoring', regatta.scoring),
            _buildField('Host', regatta.host),
            const SizedBox(height: 24),
            const Text('Regatta Files', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Card(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (final file in ['NOR', 'SI', 'SI Amendment #1'])
                    ListTile(
                      title: Text(
                        file,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(Icons.download),
                      selected: _selectedFile == file,
                      selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.15),
                      onTap: () {
                        setState(() {
                          _selectedFile = file;
                        });
                      },
                    ),
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
