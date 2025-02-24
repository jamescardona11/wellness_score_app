part of 'wellness_calculator_cubit.dart';

@immutable
class WellnessCalculatorState extends Equatable {
  final double annualIncome;
  final double monthlyCosts;
  final HealthStatus? healthStatus;

  bool get isFormValid => annualIncome > 0 && monthlyCosts > 0;

  const WellnessCalculatorState({
    this.annualIncome = 0,
    this.monthlyCosts = 0,
    this.healthStatus,
  });

  WellnessCalculatorState copyWith({
    double? annualIncome,
    double? monthlyCosts,
    HealthStatus? healthStatus,
  }) =>
      WellnessCalculatorState(
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
