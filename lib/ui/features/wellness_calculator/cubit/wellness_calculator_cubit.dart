import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/domain/use_cases/health_score_use_case.dart';

part 'wellness_calculator_state.dart';

class WellnessCalculatorCubit extends Cubit<WellnessCalculatorState> {
  final HealthScoreUseCase healthScoreUseCase;

  WellnessCalculatorCubit({
    required this.healthScoreUseCase,
  }) : super(const WellnessCalculatorState());

  void onAnnualIncomeChanged(double value) {
    emit(state.copyWith(annualIncome: value));
  }

  void onMonthlyCostsChanged(double value) {
    emit(state.copyWith(monthlyCosts: value));
  }

  void onContinuePressed() {
    if (!state.isFormValid) return;

    try {
      final healthStatusResult = healthScoreUseCase.call(
        annualIncome: state.annualIncome,
        monthlyCosts: state.monthlyCosts,
      );
      emit(state.copyWith(healthStatus: healthStatusResult));
    } catch (_) {
      emit(state.copyWith(error: true));
      Future.delayed(const Duration(seconds: 3), () {
        emit(state.copyWith(error: false));
      });
    }
  }

  void reset() {
    emit(state.copyWith(healthStatus: null));
  }
}
