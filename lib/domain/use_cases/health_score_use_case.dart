import 'package:wellness_score_app/config/constants/analytics_constants.dart';
import 'package:wellness_score_app/domain/repositories/analytics_repository.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';

final class HealthScoreUseCase {
  final AnalyticsRepository _analyticsRepository;

  HealthScoreUseCase(this._analyticsRepository);

  static const _TAX_RATE = 0.08;
  static const _HEALTHY_THRESHOLD = 0.25;
  static const _MEDIUM_THRESHOLD = 0.75;

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
