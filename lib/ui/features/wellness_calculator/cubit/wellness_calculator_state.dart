part of 'wellness_calculator_cubit.dart';

@immutable
class WellnessCalculatorState extends Equatable {
  final double annualIncome;
  final double monthlyCosts;
  final HealthStatus? healthStatus;
  final bool error;

  bool get isFormValid => annualIncome > 0 && monthlyCosts > 0;

  const WellnessCalculatorState({
    this.annualIncome = 0,
    this.monthlyCosts = 0,
    this.healthStatus,
    this.error = false,
  });

  WellnessCalculatorState copyWith({
    double? annualIncome,
    double? monthlyCosts,
    HealthStatus? healthStatus,
    bool? error,
  }) =>
      WellnessCalculatorState(
        annualIncome: annualIncome ?? this.annualIncome,
        monthlyCosts: monthlyCosts ?? this.monthlyCosts,
        healthStatus: healthStatus,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [
        annualIncome,
        monthlyCosts,
        healthStatus,
        error,
      ];
}
