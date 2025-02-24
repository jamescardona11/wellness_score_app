import 'package:flutter/material.dart';

import 'ui/core/theme/app_theme.dart';
import 'ui/features/health_calculator/health_calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HealthCalculatorScreen(),
    );
  }
}
