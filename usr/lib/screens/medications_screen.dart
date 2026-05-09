import 'package:flutter/material.dart';

class MedicationsScreen extends StatelessWidget {
  const MedicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obat-obatan'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildMedicationItem(
              context,
              name: 'Aspirin',
              dosage: '81 mg',
              frequency: '1x sehari, setelah makan',
              isTaken: true,
            ),
            const SizedBox(height: 12),
            _buildMedicationItem(
              context,
              name: 'Clopidogrel',
              dosage: '75 mg',
              frequency: '1x sehari',
              isTaken: false,
            ),
            const SizedBox(height: 12),
            _buildMedicationItem(
              context,
              name: 'Atorvastatin',
              dosage: '40 mg',
              frequency: '1x sehari, malam hari',
              isTaken: false,
            ),
            const SizedBox(height: 12),
            _buildMedicationItem(
              context,
              name: 'Bisoprolol',
              dosage: '5 mg',
              frequency: '1x sehari, pagi hari',
              isTaken: true,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fitur tambah obat belum tersedia.')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMedicationItem(BuildContext context, {required String name, required String dosage, required String frequency, required bool isTaken}) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isTaken ? Colors.green.withAlpha(50) : Colors.red.withAlpha(50),
          child: Icon(
            isTaken ? Icons.check : Icons.access_time,
            color: isTaken ? Colors.green : Colors.red,
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$dosage\\n$frequency'),
        isThreeLine: true,
        trailing: Checkbox(
          value: isTaken,
          onChanged: (bool? value) {},
        ),
      ),
    );
  }
}
