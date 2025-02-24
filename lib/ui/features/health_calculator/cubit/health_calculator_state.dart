part of 'health_calculator_cubit.dart';

@immutable
class HealthCalculatorState {
  final double annualIncome;
  final double monthlyCosts;
  final HealthStatus? healthScore;

  bool get isFormValid => annualIncome > 0 && monthlyCosts > 0;

  const HealthCalculatorState({
    this.annualIncome = 0,
    this.monthlyCosts = 0,
    this.healthScore,
  });

  HealthCalculatorState copyWith({
    double? annualIncome,
    double? monthlyCosts,
    HealthStatus? healthScore,
  }) =>
      HealthCalculatorState(
        annualIncome: annualIncome ?? this.annualIncome,
        monthlyCosts: monthlyCosts ?? this.monthlyCosts,
        healthScore: healthScore ?? this.healthScore,
      );
}
