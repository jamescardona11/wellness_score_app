import 'package:flutter/material.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';
import 'package:wellness_score_app/ui/features/health_result/components/segmented_progress_painter.dart';

class HealthScoreResult extends StatelessWidget {
  const HealthScoreResult({
    super.key,
    required this.healthStatus,
  });

  final HealthStatus healthStatus;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    const barSize = Size(85, 16);

    final segments = _segments(healthStatus);
    final segmentsActive = _color(healthStatus, colors);

    return Padding(
      padding: context.sizes.x5.paddingVertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: barSize,
            painter: SegmentedProgressPainter(
              color: segmentsActive,
              curved: false,
            ),
          ),
          CustomPaint(
            size: barSize,
            painter: SegmentedProgressPainter(
              color: segments > 1 ? segmentsActive : colors.progressBarGrey,
              curved: true,
            ),
          ),
          CustomPaint(
            size: barSize,
            painter: SegmentedProgressPainter(
              color: segments > 2 ? segmentsActive : colors.progressBarGrey,
              curved: true,
            ),
          ),
        ],
      ),
    );
  }

  Color _color(HealthStatus healthStatus, BaseColors colors) {
    switch (healthStatus) {
      case HealthStatus.healthy:
        return colors.progressBarGreen;
      case HealthStatus.medium:
        return colors.progressBarYellow;
      case HealthStatus.low:
        return colors.progressBarRed;
    }
  }

  int _segments(HealthStatus healthStatus) {
    switch (healthStatus) {
      case HealthStatus.healthy:
        return 3;
      case HealthStatus.medium:
        return 2;
      case HealthStatus.low:
        return 1;
    }
  }
}
