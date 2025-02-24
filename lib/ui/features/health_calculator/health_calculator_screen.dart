import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';
import 'package:wellness_score_app/ui/widgets/app_bar_widget.dart';
import 'package:wellness_score_app/ui/widgets/rich_text_header.dart';

class HealthCalculatorScreen extends StatelessWidget {
  const HealthCalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    final colors = context.colors;
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          RichTextHeader(
            span1: "Let's find out your ",
            span2: 'financial wellness score.',
          ),
          Center(
            child: Text('New Page'),
          ),
        ],
      ),
    );
  }
}
