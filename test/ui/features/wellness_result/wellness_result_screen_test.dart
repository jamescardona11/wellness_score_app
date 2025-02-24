import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wellness_score_app/config/constants/en_text_constants.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/ui/features/wellness_result/components/score_indicator.dart';
import 'package:wellness_score_app/ui/features/wellness_result/wellness_result_screen.dart';
import 'package:wellness_score_app/ui/widgets/button/app_button.dart';
import 'package:wellness_score_app/ui/widgets/rich_text_header.dart';

import '../../pump_widget_helper.dart';
import 'wellness_result_screen_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GoRouter>()])
void main() {
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockGoRouter = MockGoRouter();
  });

  group('WellnessResultScreen', () {
    testWidgets('should render healthy status correctly', (tester) async {
      await tester.pumpWidgetWithMaterialApp(
        const WellnessResultScreen(
          healthStatus: HealthStatus.healthy,
        ),
        goRouter: mockGoRouter,
      );

      // Verify header
      expect(find.byType(RichTextHeader), findsOneWidget);
      final richTextHeader = tester.widget<RichTextHeader>(find.byType(RichTextHeader));
      expect(richTextHeader.span1, equals(TextConstants.financialWellnessScoreResult));
      expect(richTextHeader.span2, equals(TextConstants.financialWellnessScoreResultDescription));

      // Verify result texts
      expect(find.text(TextConstants.healthyScoreResult), findsOneWidget);
      expect(find.text(TextConstants.scoreResultDescription), findsOneWidget);
      expect(find.text(TextConstants.healthyScoreResultName), findsOneWidget);

      // Verify return button
      expect(find.text(TextConstants.returnButton), findsOneWidget);
    });

    testWidgets('should render medium status correctly', (tester) async {
      await tester.pumpWidgetWithMaterialApp(
        const WellnessResultScreen(
          healthStatus: HealthStatus.medium,
        ),
        goRouter: mockGoRouter,
      );

      // Verify result texts
      expect(find.text(TextConstants.mediumScoreResult), findsOneWidget);
      expect(find.text(TextConstants.scoreResultDescription), findsOneWidget);
      expect(find.text(TextConstants.mediumScoreResultName), findsOneWidget);
    });

    testWidgets('should render low status correctly', (tester) async {
      await tester.pumpWidgetWithMaterialApp(
        const WellnessResultScreen(
          healthStatus: HealthStatus.low,
        ),
        goRouter: mockGoRouter,
      );

      // Verify result texts
      expect(find.text(TextConstants.lowScoreResult), findsOneWidget);
      expect(find.text(TextConstants.scoreResultDescription), findsOneWidget);
      expect(find.text(TextConstants.lowScoreResultName), findsOneWidget);
    });

    testWidgets('should navigate back when return button is pressed', (tester) async {
      when(mockGoRouter.pop()).thenReturn(true);

      await tester.pumpWidgetWithMaterialApp(
        const WellnessResultScreen(
          healthStatus: HealthStatus.healthy,
        ),
        goRouter: mockGoRouter,
      );

      // Find and tap return button
      final returnButton = find.byType(AppButton);
      await tester.tap(returnButton);
      await tester.pumpAndSettle();

      // Verify navigation
      verify(mockGoRouter.pop()).called(1);
    });

    testWidgets('should show secure text widget', (tester) async {
      await tester.pumpWidgetWithMaterialApp(
        const WellnessResultScreen(
          healthStatus: HealthStatus.healthy,
        ),
        goRouter: mockGoRouter,
      );

      expect(find.text(TextConstants.secureInformation), findsOneWidget);
    });

    testWidgets('should show score indicator with correct status', (tester) async {
      await tester.pumpWidgetWithMaterialApp(
        const WellnessResultScreen(
          healthStatus: HealthStatus.healthy,
        ),
        goRouter: mockGoRouter,
      );

      expect(find.byType(HealthScoreResult), findsOneWidget);
      final scoreIndicator = tester.widget<HealthScoreResult>(find.byType(HealthScoreResult));
      expect(scoreIndicator.healthStatus, equals(HealthStatus.healthy));
    });
  });
}
