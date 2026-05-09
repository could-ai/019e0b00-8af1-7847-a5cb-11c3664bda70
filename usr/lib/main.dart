import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';
import 'screens/medications_screen.dart';
import 'screens/vitals_screen.dart';
import 'screens/emergency_plan_screen.dart';

void main() {
  runApp(const AcsManagementApp());
}

class AcsManagementApp extends StatelessWidget {
  const AcsManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manajemen Mandiri Pasien ACS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD32F2F), // Red theme for cardiovascular health
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/medications': (context) => const MedicationsScreen(),
        '/vitals': (context) => const VitalsScreen(),
        '/emergency': (context) => const EmergencyPlanScreen(),
      },
    );
  }
}
