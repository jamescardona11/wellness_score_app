import 'package:flutter/material.dart';
import 'package:wellness_score_app/config/assets/app_icons.dart';
import 'package:wellness_score_app/config/constants/en_text_constants.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

import 'text/app_text.dart';

class SecureWidget extends StatelessWidget {
  const SecureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final sizes = context.sizes;
    return Padding(
      padding: EdgeInsets.only(bottom: sizes.x2, top: sizes.x8),
      child: Column(
        children: [
          Icon(
            AppIcons.lockIcon,
            size: sizes.x6,
            color: colors.grey200,
          ),
          SizedBox(height: sizes.x4),
          AppText.paragraph3(
            TextConstants.secureInformation,
            color: colors.grey100,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
