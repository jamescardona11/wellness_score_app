import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wellness_score_app/config/assets/app_assets.dart';
import 'package:wellness_score_app/config/constants/en_text_constants.dart';
import 'package:wellness_score_app/config/navigator/app_router.dart';
import 'package:wellness_score_app/data/repositories/mock_analytics_repository.dart';
import 'package:wellness_score_app/domain/use_cases/health_score_use_case.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';
import 'package:wellness_score_app/ui/widgets/app_bar_widget.dart';
import 'package:wellness_score_app/ui/widgets/button/app_button.dart';
import 'package:wellness_score_app/ui/widgets/card_widget.dart';
import 'package:wellness_score_app/ui/widgets/rich_text_header.dart';
import 'package:wellness_score_app/ui/widgets/secure_widget.dart';
import 'package:wellness_score_app/ui/widgets/text/app_text.dart';
import 'package:wellness_score_app/ui/widgets/text/input/finance_input_field.dart';

import 'cubit/health_calculator_cubit.dart';

class HealthCalculatorScreen extends StatelessWidget {
  const HealthCalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final sizes = context.sizes;
    return BlocProvider(
      create: (context) => HealthCalculatorCubit(
        healthScoreUseCase: HealthScoreUseCase(MockAnalyticsRepository()),
      ),
      child: BlocListener<HealthCalculatorCubit, HealthCalculatorState>(
        listenWhen: (p, c) => p.healthStatus != c.healthStatus,
        listener: (context, state) {
          final status = state.healthStatus;

          context.push(
            AppRouter.result,
            extra: status,
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                          const _ScoreCalculatorForm(),
                        ],
                      ),
                    ),
                    const SecureWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScoreCalculatorForm extends StatelessWidget {
  const _ScoreCalculatorForm();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HealthCalculatorCubit>();
    final sizes = context.sizes;
    return Column(
      children: [
        FinanceInputField(
          label: TextConstants.annualIncome,
          onChanged: cubit.onAnnualIncomeChanged,
          action: TextInputAction.next,
        ),
        SizedBox(height: sizes.x4),
        FinanceInputField(
          label: TextConstants.monthlyCosts,
          onChanged: cubit.onMonthlyCostsChanged,
          action: TextInputAction.done,
        ),
        SizedBox(height: sizes.x4),
        BlocSelector<HealthCalculatorCubit, HealthCalculatorState, bool>(
          selector: (state) {
            return state.isFormValid;
          },
          builder: (context, isFormValid) {
            return AppButton.filled(
              label: TextConstants.continueButton,
              enabled: isFormValid,
              onPressed: () {
                FocusScope.of(context).unfocus();
                cubit.onContinuePressed();
              },
            );
          },
        ),
      ],
    );
  }
}
