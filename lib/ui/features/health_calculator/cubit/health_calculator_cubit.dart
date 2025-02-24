import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/domain/use_cases/health_score_use_case.dart';

part 'health_calculator_state.dart';

class HealthCalculatorCubit extends Cubit<HealthCalculatorState> {
  final HealthScoreUseCase healthScoreUseCase;

  HealthCalculatorCubit({
    required this.healthScoreUseCase,
  }) : super(const HealthCalculatorState());

  void onAnnualIncomeChanged(double value) {
    emit(state.copyWith(annualIncome: value));
  }

  void onMonthlyCostsChanged(double value) {
    emit(state.copyWith(monthlyCosts: value));
  }

  void onContinuePressed() {
    if (!state.isFormValid) return;

    final healthStatusResult = healthScoreUseCase.call(
      annualIncome: state.annualIncome,
      monthlyCosts: state.monthlyCosts,
    );

    emit(state.copyWith(healthStatus: healthStatusResult));
  }

  void reset() {
    emit(state.copyWith(healthStatus: null));
  }
}
