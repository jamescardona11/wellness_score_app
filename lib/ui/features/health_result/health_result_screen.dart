import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wellness_score_app/config/assets/app_assets.dart';
import 'package:wellness_score_app/config/constants/en_text_constants.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';
import 'package:wellness_score_app/ui/widgets/app_bar_widget.dart';
import 'package:wellness_score_app/ui/widgets/button/app_button.dart';
import 'package:wellness_score_app/ui/widgets/card_widget.dart';
import 'package:wellness_score_app/ui/widgets/rich_text_header.dart';
import 'package:wellness_score_app/ui/widgets/secure_text_widget.dart';
import 'package:wellness_score_app/ui/widgets/text/app_text.dart';

import 'components/score_indicator.dart';

class HealthResultScreen extends StatelessWidget {
  final HealthStatus healthStatus;

  const HealthResultScreen({
    super.key,
    required this.healthStatus,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final sizes = context.sizes;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: sizes.x5.paddingHorizontal,
          child: Column(
            children: [
              Padding(
                padding: sizes.x5.paddingVertical,
                child: const RichTextHeader(
                  span1: TextConstants.financialWellnessScoreResult,
                  span2: TextConstants.financialWellnessScoreResultDescription,
                ),
              ),
              CardWidget(
                child: Column(
                  children: [
                    SvgPicture.asset(AppAssets.score, height: sizes.x12),
                    HealthScoreResult(
                      healthStatus: healthStatus,
                    ),
                    AppText.headingXS(_scoreResult(healthStatus)),
                    AppText.paragraph(
                      TextConstants.scoreResultDescription,
                      color: colors.grey100,
                    ),
                    AppText.paragraphBold(
                      _scoreResultName(healthStatus),
                      color: colors.grey100,
                    ),
                    SizedBox(height: sizes.x8),
                    AppButton.outlined(
                      label: TextConstants.returnButton,
                      onPressed: context.pop,
                    ),
                  ],
                ),
              ),
              const SecureTextWidget(),
            ],
          ),
        ),
      ),
    );
  }

  String _scoreResult(HealthStatus healthStatus) {
    switch (healthStatus) {
      case HealthStatus.healthy:
        return TextConstants.healthyScoreResult;
      case HealthStatus.medium:
        return TextConstants.mediumScoreResult;
      case HealthStatus.low:
        return TextConstants.lowScoreResult;
    }
  }

  String _scoreResultName(HealthStatus healthStatus) {
    switch (healthStatus) {
      case HealthStatus.healthy:
        return TextConstants.healthyScoreResultName;
      case HealthStatus.medium:
        return TextConstants.mediumScoreResultName;
      case HealthStatus.low:
        return TextConstants.lowScoreResultName;
    }
  }
}
