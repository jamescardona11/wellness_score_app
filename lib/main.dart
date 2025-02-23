import 'package:flutter/material.dart';

import 'ui/core/theme/app_theme.dart';
import 'ui/widgets/button/app_button.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Text'),
      ),
      body: Center(
        child: AppButton.outlined(
          label: 'Button',
          enabled: false,
          onPressed: () {},
        ),
      ),
    );
  }
}
