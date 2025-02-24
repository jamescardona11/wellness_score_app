import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:wellness_score_app/ui/core/theme/app_theme.dart';

extension PumpWidgetHelper on WidgetTester {
  Future<void> pumpWidgetWithMaterialApp(
    Widget widget, {
    required GoRouter goRouter,
    ThemeData? theme,
  }) async {
    await pumpWidget(
      MaterialApp(
        theme: theme ?? AppTheme.lightTheme,
        home: InheritedGoRouter(
          goRouter: goRouter,
          child: widget,
        ),
      ),
    );
    await pumpAndSettle();
  }
}
