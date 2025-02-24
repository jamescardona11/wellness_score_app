part of 'health_calculator_cubit.dart';

@immutable
class HealthCalculatorState with EquatableMixin {
  final double annualIncome;
  final double monthlyCosts;
  final HealthStatus? healthStatus;

  bool get isFormValid => annualIncome > 0 && monthlyCosts > 0;

  const HealthCalculatorState({
    this.annualIncome = 0,
    this.monthlyCosts = 0,
    this.healthStatus,
  });

  HealthCalculatorState copyWith({
    double? annualIncome,
    double? monthlyCosts,
    HealthStatus? healthStatus,
  }) =>
      HealthCalculatorState(
        annualIncome: annualIncome ?? this.annualIncome,
        monthlyCosts: monthlyCosts ?? this.monthlyCosts,
        healthStatus: healthStatus,
      );

  @override
  List<Object?> get props => [
        annualIncome,
        monthlyCosts,
        healthStatus,
      ];
}
