import 'package:flutter/material.dart';
import 'package:wellness_score_app/config/constants/en_text_constants.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';
import 'package:wellness_score_app/ui/widgets/text/app_text.dart';

/// A utility class for displaying error messages as snackbars.
///
/// This class provides a static method to show a snackbar with an error message.
/// The snackbar is styled with a red background and white text.
///
/// Example usage:
/// ```dart
/// SnackBarError.show(context, message: 'An error occurred');
/// ```
abstract class SnackBarError {
  static void show(
    BuildContext context, {
    required String message,
  }) {
    final colors = context.colors;
    final sizes = context.sizes;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText.paragraph(
          message,
          color: colors.white,
        ),
        backgroundColor: colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sizes.x2),
        ),
        margin: EdgeInsets.all(sizes.x4),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: TextConstants.dismissSnackBar,
          textColor: colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
