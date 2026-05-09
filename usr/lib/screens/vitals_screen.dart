import 'package:flutter/material.dart';

class VitalsScreen extends StatelessWidget {
  const VitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tanda Vital'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildVitalCard(
              context,
              title: 'Tekanan Darah',
              value: '120/80',
              unit: 'mmHg',
              icon: Icons.favorite_border,
              color: Colors.red,
              date: 'Hari ini, 08:00',
            ),
            const SizedBox(height: 16),
            _buildVitalCard(
              context,
              title: 'Denyut Nadi',
              value: '72',
              unit: 'bpm',
              icon: Icons.monitor_heart,
              color: Colors.blue,
              date: 'Hari ini, 08:00',
            ),
            const SizedBox(height: 16),
            _buildVitalCard(
              context,
              title: 'Berat Badan',
              value: '70',
              unit: 'kg',
              icon: Icons.monitor_weight_outlined,
              color: Colors.green,
              date: 'Kemarin, 07:30',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fitur catat tanda vital belum tersedia.')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildVitalCard(BuildContext context, {required String title, required String value, required String unit, required IconData icon, required Color color, required String date}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                Text(date, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  unit,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
