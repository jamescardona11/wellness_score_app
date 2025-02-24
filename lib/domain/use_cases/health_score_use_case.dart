import 'package:wellness_score_app/config/constants/analytics_constants.dart';
import 'package:wellness_score_app/domain/repositories/analytics_repository.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';

/// A use case that calculates a user's financial health status based on their income and expenses.
///
/// The calculation takes into account:
/// * Annual income (before tax)
/// * Monthly costs
/// * Tax rate (currently fixed at 8%)
///
/// The health score is determined by calculating the ratio between annual expenses
/// and net income (after tax):
///
/// * Healthy: Ratio ≤ 25% of net income
/// * Medium: Ratio between 25% and 75% of net income
/// * Low: Ratio > 75% of net income
///
/// Example:
/// ```dart
/// final healthScore = HealthScoreUseCase(analyticsRepository);
/// final status = healthScore(
///   annualIncome: 100000,
///   monthlyCosts: 2000,
/// );
/// ```
class HealthScoreUseCase {
  final AnalyticsRepository _analyticsRepository;

  /// Creates a new instance of [HealthScoreUseCase].
  ///
  /// Requires an [AnalyticsRepository] to track score calculations.
  HealthScoreUseCase(this._analyticsRepository);

  /// The tax rate applied to annual income (currently 8%).
  static const _TAX_RATE = 0.08;

  /// The threshold ratio for healthy financial status (25% of net income).
  static const _HEALTHY_THRESHOLD = 0.25;

  /// The threshold ratio for medium financial status (75% of net income).
  static const _MEDIUM_THRESHOLD = 0.75;

  /// Calculates the financial health status based on income and costs.
  ///
  /// Parameters:
  /// * [annualIncome]: The user's annual income before tax
  /// * [monthlyCosts]: The user's average monthly expenses
  ///
  /// Returns a [HealthStatus] indicating the financial health level.
  ///
  /// Throws an [AssertionError] if either income or costs are negative.
  HealthStatus call({
    required double annualIncome,
    required double monthlyCosts,
  }) {
    assert(
      annualIncome > 0 && monthlyCosts > 0,
      'Annual income and monthly costs must be greater or equal to 0',
    );

    final annualNetIncome = annualIncome * (1 - _TAX_RATE);
    final annualCosts = monthlyCosts * 12;
    final costRatio = annualCosts / annualNetIncome;

    HealthStatus result = HealthStatus.low;

    if (costRatio <= _HEALTHY_THRESHOLD) {
      result = HealthStatus.healthy;
    } else if (costRatio <= _MEDIUM_THRESHOLD) {
      result = HealthStatus.medium;
    }

    _trackHealthScore(annualIncome, monthlyCosts, result);

    return result;
  }

  void _trackHealthScore(
    double annualIncome,
    double monthlyCosts,
    HealthStatus result,
  ) {
    _analyticsRepository.trackEvent(
      AnalyticsConstants.eventHealthScore,
      data: {
        AnalyticsConstants.propAnnualIncome: annualIncome,
        AnalyticsConstants.propMonthlyCosts: monthlyCosts,
        AnalyticsConstants.propResult: result.name,
      },
    );
  }
}
