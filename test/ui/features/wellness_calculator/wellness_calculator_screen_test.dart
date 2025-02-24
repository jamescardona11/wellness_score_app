import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wellness_score_app/config/constants/en_text_constants.dart';
import 'package:wellness_score_app/config/navigator/app_router.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/ui/features/wellness_calculator/cubit/wellness_calculator_cubit.dart';
import 'package:wellness_score_app/ui/features/wellness_calculator/wellness_calculator_screen.dart';
import 'package:wellness_score_app/ui/widgets/button/app_button.dart';
import 'package:wellness_score_app/ui/widgets/rich_text_header.dart';
import 'package:wellness_score_app/ui/widgets/text/input/finance_input_field.dart';

import '../../pump_widget_helper.dart';
import 'wellness_calculator_screen_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<WellnessCalculatorCubit>(),
  MockSpec<GoRouter>(),
])
void main() {
  late MockWellnessCalculatorCubit mockCubit;
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockCubit = MockWellnessCalculatorCubit();
    mockGoRouter = MockGoRouter();

    when(mockCubit.state).thenReturn(const WellnessCalculatorState());
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());
  });

  group('WellnessCalculatorScreen', () {
    testWidgets('should render initial state correctly', (tester) async {
      await tester.pumpWidgetWithMaterialApp(
        WellnessCalculatorScreen(
          cubit: mockCubit,
        ),
        goRouter: mockGoRouter,
      );

      // Verify header texts
      expect(find.byType(RichTextHeader), findsOneWidget);
      final richTextHeader = tester.widget<RichTextHeader>(find.byType(RichTextHeader));
      expect(richTextHeader.span1, equals(TextConstants.financialWellnessScore));
      expect(richTextHeader.span2, equals(TextConstants.financialWellnessScoreDescription));

      // Verify form elements
      expect(find.text(TextConstants.financialWellnessTest), findsOneWidget);
      expect(find.text(TextConstants.financialWellnessTestDescription), findsOneWidget);
      expect(find.byType(FinanceInputField), findsNWidgets(2));
      expect(find.text(TextConstants.annualIncome), findsOneWidget);
      expect(find.text(TextConstants.monthlyCosts), findsOneWidget);

      // Verify button is disabled initially
      final button = find.byType(AppButton);
      expect(button, findsOneWidget);
      expect(tester.widget<AppButton>(button).enabled, isFalse);
    });

    testWidgets('should call cubit when income field changes', (tester) async {
      await tester.pumpWidgetWithMaterialApp(
        WellnessCalculatorScreen(
          cubit: mockCubit,
        ),
        goRouter: mockGoRouter,
      );

      final incomeField = find.byType(FinanceInputField).first;
      await tester.enterText(incomeField, '100000');
      await tester.pumpAndSettle();

      verify(mockCubit.onAnnualIncomeChanged(100000)).called(1);
    });

    testWidgets('should call cubit when costs field changes', (tester) async {
      await tester.pumpWidgetWithMaterialApp(
        WellnessCalculatorScreen(
          cubit: mockCubit,
        ),
        goRouter: mockGoRouter,
      );

      final costsField = find.byType(FinanceInputField).last;
      await tester.enterText(costsField, '5000');
      await tester.pumpAndSettle();

      verify(mockCubit.onMonthlyCostsChanged(5000)).called(1);
    });

    testWidgets('should enable continue button when form is valid', (tester) async {
      when(mockCubit.state).thenReturn(
        const WellnessCalculatorState(
          annualIncome: 100000,
          monthlyCosts: 5000,
        ),
      );

      await tester.pumpWidgetWithMaterialApp(
        WellnessCalculatorScreen(
          cubit: mockCubit,
        ),
        goRouter: mockGoRouter,
      );

      final button = find.byType(AppButton);
      expect(tester.widget<AppButton>(button).enabled, isTrue);
    });

    testWidgets('should call cubit when continue button is pressed', (tester) async {
      when(mockCubit.state).thenReturn(
        const WellnessCalculatorState(
          annualIncome: 100000,
          monthlyCosts: 5000,
        ),
      );

      await tester.pumpWidgetWithMaterialApp(
        WellnessCalculatorScreen(
          cubit: mockCubit,
        ),
        goRouter: mockGoRouter,
      );

      final button = find.byType(AppButton);
      await tester.tap(button);
      await tester.pumpAndSettle();

      verify(mockCubit.onContinuePressed()).called(1);
    });

    testWidgets('should navigate to result screen when health status is available', (tester) async {
      when(mockCubit.stream).thenAnswer(
        (_) => Stream.value(
          const WellnessCalculatorState(healthStatus: HealthStatus.healthy),
        ),
      );

      when(mockGoRouter.push(any, extra: anyNamed('extra'))).thenAnswer((_) async => null);

      await tester.pumpWidgetWithMaterialApp(
        WellnessCalculatorScreen(
          cubit: mockCubit,
        ),
        goRouter: mockGoRouter,
      );

      verify(mockGoRouter.push(AppRouter.result, extra: HealthStatus.healthy)).called(1);
    });

    testWidgets('should reset cubit when returning from result screen', (tester) async {
      when(mockCubit.stream).thenAnswer(
        (_) => Stream.value(
          const WellnessCalculatorState(healthStatus: HealthStatus.healthy),
        ),
      );

      when(mockGoRouter.push(any, extra: anyNamed('extra'))).thenAnswer((_) async => null);

      await tester.pumpWidgetWithMaterialApp(
        WellnessCalculatorScreen(
          cubit: mockCubit,
        ),
        goRouter: mockGoRouter,
      );

      verify(mockCubit.reset()).called(1);
    });
  });
}
