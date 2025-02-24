import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/domain/use_cases/health_score_use_case.dart';
import 'package:wellness_score_app/ui/features/wellness_calculator/cubit/wellness_calculator_cubit.dart';

import 'wellness_calculator_cubit_test.mocks.dart';

@GenerateMocks([HealthScoreUseCase])
void main() {
  group('WellnessCalculatorCubit', () {
    late WellnessCalculatorCubit cubit;
    late MockHealthScoreUseCase mockHealthScoreUseCase;

    setUp(() {
      mockHealthScoreUseCase = MockHealthScoreUseCase();
      cubit = WellnessCalculatorCubit(
        healthScoreUseCase: mockHealthScoreUseCase,
      );
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is correct', () {
      expect(cubit.state, equals(const WellnessCalculatorState()));
      expect(cubit.state.annualIncome, equals(0.0));
      expect(cubit.state.monthlyCosts, equals(0.0));
      expect(cubit.state.healthStatus, equals(null));
      expect(cubit.state.isFormValid, equals(false));
    });

    blocTest<WellnessCalculatorCubit, WellnessCalculatorState>(
      'emits updated state when annual income is changed',
      build: () => cubit,
      act: (cubit) => cubit.onAnnualIncomeChanged(50000),
      expect: () => [
        const WellnessCalculatorState(annualIncome: 50000),
      ],
    );

    blocTest<WellnessCalculatorCubit, WellnessCalculatorState>(
      'emits updated state when monthly costs is changed',
      build: () => cubit,
      act: (cubit) => cubit.onMonthlyCostsChanged(2000),
      expect: () => [
        const WellnessCalculatorState(monthlyCosts: 2000),
      ],
    );

    blocTest<WellnessCalculatorCubit, WellnessCalculatorState>(
      'does not calculate health status when form is invalid',
      build: () => cubit,
      act: (cubit) => cubit.onContinuePressed(),
      verify: (_) {
        verifyNever(
          mockHealthScoreUseCase(
            annualIncome: 100,
            monthlyCosts: 100,
          ),
        );
      },
    );

    blocTest<WellnessCalculatorCubit, WellnessCalculatorState>(
      'calculates health status when form is valid',
      setUp: () {
        when(
          mockHealthScoreUseCase(
            annualIncome: 50000,
            monthlyCosts: 2000,
          ),
        ).thenReturn(HealthStatus.healthy);
      },
      build: () => cubit,
      act: (cubit) {
        cubit.onAnnualIncomeChanged(50000);
        cubit.onMonthlyCostsChanged(2000);
        cubit.onContinuePressed();
      },
      expect: () => [
        const WellnessCalculatorState(annualIncome: 50000),
        const WellnessCalculatorState(
          annualIncome: 50000,
          monthlyCosts: 2000,
        ),
        const WellnessCalculatorState(
          annualIncome: 50000,
          monthlyCosts: 2000,
          healthStatus: HealthStatus.healthy,
        ),
      ],
      verify: (_) {
        verify(
          mockHealthScoreUseCase(
            annualIncome: 50000,
            monthlyCosts: 2000,
          ),
        ).called(1);
      },
    );

    blocTest<WellnessCalculatorCubit, WellnessCalculatorState>(
      'resets state when reset is called',
      seed: () => const WellnessCalculatorState(
        annualIncome: 50000,
        monthlyCosts: 2000,
        healthStatus: HealthStatus.healthy,
      ),
      build: () => cubit,
      act: (cubit) => cubit.reset(),
      expect: () => [
        const WellnessCalculatorState(
          annualIncome: 50000,
          monthlyCosts: 2000,
          healthStatus: null,
        ),
      ],
    );
  });
}
