import 'package:flutter/material.dart';

class EmergencyPlanScreen extends StatelessWidget {
  const EmergencyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rencana Darurat'),
        backgroundColor: Colors.red[700],
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.red[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Icon(Icons.warning_amber_rounded, size: 64, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(
                        'GEJALA SERANGAN JANTUNG',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      _buildSymptomItem('Nyeri dada hebat (seperti ditekan benda berat)'),
                      _buildSymptomItem('Sesak napas tiba-tiba'),
                      _buildSymptomItem('Keringat dingin berlebihan'),
                      _buildSymptomItem('Nyeri menjalar ke lengan kiri, leher, atau rahang'),
                      _buildSymptomItem('Mual atau muntah'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Tindakan yang Harus Dilakukan:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: const CircleAvatar(child: Text('1')),
                title: const Text('Hentikan semua aktivitas dan istirahat segera.'),
              ),
              ListTile(
                leading: const CircleAvatar(child: Text('2')),
                title: const Text('Gunakan Nitrat sublingual (di bawah lidah) sesuai anjuran dokter.'),
              ),
              ListTile(
                leading: const CircleAvatar(child: Text('3')),
                title: const Text('Jika nyeri tidak berkurang setelah 5 menit, HUBUNGI BANTUAN DARURAT.'),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Menghubungi layanan darurat 112/119...')),
                  );
                },
                icon: const Icon(Icons.call),
                label: const Text('HUBUNGI AMBULANS (119)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSymptomItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 10, color: Colors.red),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
