import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellness_score_app/config/assets/app_assets.dart';
import 'package:wellness_score_app/config/constants/en_text_constants.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';
import 'package:wellness_score_app/ui/widgets/app_bar_widget.dart';
import 'package:wellness_score_app/ui/widgets/card_widget.dart';
import 'package:wellness_score_app/ui/widgets/rich_text_header.dart';
import 'package:wellness_score_app/ui/widgets/text/app_text.dart';

class HealthCalculatorScreen extends StatelessWidget {
  const HealthCalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final sizes = context.sizes;
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: sizes.x5.paddingHorizontal,
        child: Column(
          children: [
            Padding(
              padding: sizes.x5.paddingVertical,
              child: const RichTextHeader(
                span1: TextConstants.financialWellnessScore,
                span2: TextConstants.financialWellnessScoreDescription,
              ),
            ),
            CardWidget(
              child: Column(
                children: [
                  SvgPicture.asset(AppAssets.score, height: sizes.x12),
                  SizedBox(height: sizes.x4),
                  AppText.title2(TextConstants.financialWellnessTest),
                  AppText.paragraph2(
                    TextConstants.financialWellnessTestDescription,
                    color: colors.grey100,
                  ),
                  SizedBox(height: sizes.x4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
