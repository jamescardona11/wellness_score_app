import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/ui/widgets/app_bar_widget.dart';
import 'package:wellness_score_app/ui/widgets/button/app_button.dart';

class HealthResult extends StatelessWidget {
  final HealthStatus healthStatus;

  const HealthResult({
    super.key,
    required this.healthStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Center(
        child: Column(
          children: [
            Text('Health Score Result: ${healthStatus.name}'),
            AppButton.outlined(
              label: 'Back',
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
