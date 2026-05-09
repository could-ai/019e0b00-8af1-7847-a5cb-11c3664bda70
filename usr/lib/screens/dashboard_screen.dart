import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen ACS'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat datang!',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Pantau kesehatan jantung Anda setiap hari.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                  if (constraints.maxWidth > 900) crossAxisCount = 4;
                  
                  return GridView.count(
                    crossAxisCount: crossAxisCount,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildDashboardCard(
                        context,
                        title: 'Obat-obatan',
                        icon: Icons.medication,
                        color: Colors.blue,
                        route: '/medications',
                      ),
                      _buildDashboardCard(
                        context,
                        title: 'Tanda Vital',
                        icon: Icons.favorite,
                        color: Colors.red,
                        route: '/vitals',
                      ),
                      _buildDashboardCard(
                        context,
                        title: 'Rencana Darurat',
                        icon: Icons.warning_rounded,
                        color: Colors.orange,
                        route: '/emergency',
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 32),
              Text(
                'Tips Hari Ini',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.lightbulb, color: theme.colorScheme.secondary, size: 40),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Pastikan Anda meminum obat tepat waktu dan hindari aktivitas fisik yang berlebihan jika merasa sesak napas.',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, {required String title, required IconData icon, required Color color, required String route}) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
