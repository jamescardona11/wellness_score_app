import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wellness_score_app/config/assets/app_assets.dart';
import 'package:wellness_score_app/config/constants/en_text_constants.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';
import 'package:wellness_score_app/ui/widgets/app_bar_widget.dart';
import 'package:wellness_score_app/ui/widgets/card_widget.dart';
import 'package:wellness_score_app/ui/widgets/rich_text_header.dart';
import 'package:wellness_score_app/ui/widgets/secure_text_widget.dart';
import 'package:wellness_score_app/ui/widgets/text/app_text.dart';

class HealthResult extends StatelessWidget {
  final HealthStatus healthStatus;

  const HealthResult({
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          reverse: true,
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
                      SizedBox(height: sizes.x4),
                      AppText.headingXS(TextConstants.financialWellnessResult),
                      AppText.paragraph(
                        TextConstants.financialWellnessResultDesc,
                        color: colors.grey100,
                      ),
                      SizedBox(height: sizes.x4),
                    ],
                  ),
                ),
                const SecureTextWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
