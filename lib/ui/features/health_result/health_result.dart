import 'package:flutter/material.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';

class HealthResult extends StatelessWidget {
  final HealthStatus healthStatus;

  const HealthResult({
    super.key,
    required this.healthStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Health Score Result: ${healthStatus.name}'),
      ),
    );
  }
}
