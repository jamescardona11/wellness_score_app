import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wellness_score_app/config/constants/analytics_constants.dart';
import 'package:wellness_score_app/domain/repositories/analytics_repository.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/domain/use_cases/health_score.dart';

import 'health_score_test.mocks.dart';

@GenerateMocks([AnalyticsRepository])
void main() {
  late HealthScore healthScore;
  late MockAnalyticsRepository mockAnalyticsRepository;

  setUp(() {
    mockAnalyticsRepository = MockAnalyticsRepository();
    healthScore = HealthScore(mockAnalyticsRepository);
  });

  void trackEventVerification(double annualIncome, double monthlyCosts, HealthStatus result) => mockAnalyticsRepository.trackEvent(
        AnalyticsConstants.eventHealthScore,
        data: {
          AnalyticsConstants.propAnnualIncome: annualIncome,
          AnalyticsConstants.propMonthlyCosts: monthlyCosts,
          AnalyticsConstants.propResult: result.name,
        },
      );

  group('HealthScore', () {
    test('should return HEALTHY status when cost ratio is <= 0.25', () {
      // Arrange
      const annualIncome = 100000.0;
      const monthlyCosts = 1500.0; // Annual costs: 18000, ratio ≈ 0.195

      // Act
      final result = healthScore(
        annualIncome: annualIncome,
        monthlyCosts: monthlyCosts,
      );

      // Assert
      verify(trackEventVerification(annualIncome, monthlyCosts, result)).called(1);
      expect(result, equals(HealthStatus.healthy));
    });

    test('should return MEDIUM status when cost ratio is > 0.25 and <= 0.75', () {
      // Arrange
      const annualIncome = 100000.0;
      const monthlyCosts = 4000.0; // Annual costs: 48000, ratio ≈ 0.52

      // Act
      final result = healthScore(
        annualIncome: annualIncome,
        monthlyCosts: monthlyCosts,
      );

      // Assert
      verify(trackEventVerification(annualIncome, monthlyCosts, result)).called(1);
      expect(result, equals(HealthStatus.medium));
    });

    test('should return LOW status when cost ratio is > 0.75', () {
      // Arrange
      const annualIncome = 100000.0;
      const monthlyCosts = 7000.0; // Annual costs: 84000, ratio ≈ 0.91

      // Act
      final result = healthScore(
        annualIncome: annualIncome,
        monthlyCosts: monthlyCosts,
      );

      // Assert
      verify(trackEventVerification(annualIncome, monthlyCosts, result)).called(1);
      expect(result, equals(HealthStatus.low));
    });

    test('should throw AssertionError when income is negative', () {
      // Act & Assert
      expect(
        () => healthScore(annualIncome: -1000, monthlyCosts: 1000),
        throwsA(isA<AssertionError>()),
      );
    });

    test('should throw AssertionError when monthly costs are negative', () {
      // Act & Assert
      expect(
        () => healthScore(annualIncome: 1000, monthlyCosts: -1000),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
