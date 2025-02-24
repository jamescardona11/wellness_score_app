import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wellness_score_app/config/assets/app_assets.dart';
import 'package:wellness_score_app/config/constants/en_text_constants.dart';
import 'package:wellness_score_app/config/di/di.dart';
import 'package:wellness_score_app/config/navigator/app_router.dart';
import 'package:wellness_score_app/ui/core/shared_widgets/snackbar_error.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';
import 'package:wellness_score_app/ui/widgets/app_bar_widget.dart';
import 'package:wellness_score_app/ui/widgets/button/app_button.dart';
import 'package:wellness_score_app/ui/widgets/card_widget.dart';
import 'package:wellness_score_app/ui/widgets/rich_text_header.dart';
import 'package:wellness_score_app/ui/widgets/secure_text_widget.dart';
import 'package:wellness_score_app/ui/widgets/text/app_text.dart';
import 'package:wellness_score_app/ui/widgets/text/input/finance_input_field.dart';

import 'cubit/wellness_calculator_cubit.dart';

class WellnessCalculatorScreen extends StatelessWidget {
  const WellnessCalculatorScreen({
    super.key,
    this.cubit,
  });

  final WellnessCalculatorCubit? cubit;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final sizes = context.sizes;

    return BlocProvider(
      create: (context) => cubit ?? getIt<WellnessCalculatorCubit>(),
      child: BlocListener<WellnessCalculatorCubit, WellnessCalculatorState>(
        listenWhen: (p, c) => c.error != null,
        listener: (context, state) {
          if (state.error == true) {
            SnackBarError.show(context, message: TextConstants.errorCalculatingScore);
          }
        },
        child: BlocListener<WellnessCalculatorCubit, WellnessCalculatorState>(
          listenWhen: (p, c) => c.healthStatus != null,
          listener: (context, state) {
            final status = state.healthStatus;
            final cubit = context.read<WellnessCalculatorCubit>();

            context
                .push(
                  AppRouter.result,
                  extra: status,
                )
                .then((_) => cubit.reset());
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
                            AppText.headingXS(TextConstants.financialWellnessTest),
                            AppText.paragraph(
                              TextConstants.financialWellnessTestDescription,
                              color: colors.grey100,
                            ),
                            SizedBox(height: sizes.x4),
                            const _ScoreCalculatorForm(),
                          ],
                        ),
                      ),
                      const SecureTextWidget(),
                    ],
                  ),
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
    final cubit = context.read<WellnessCalculatorCubit>();
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
        BlocSelector<WellnessCalculatorCubit, WellnessCalculatorState, bool>(
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
