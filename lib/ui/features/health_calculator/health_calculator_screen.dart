import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/widgets/app_bar_widget.dart';

class HealthCalculatorScreen extends StatelessWidget {
  const HealthCalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Center(
        child: Text('New Page'),
      ),
    );
  }
}
