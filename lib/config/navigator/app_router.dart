import 'package:go_router/go_router.dart';
import 'package:wellness_score_app/domain/types/health_status.dart';
import 'package:wellness_score_app/ui/features/health_calculator/health_calculator_screen.dart';
import 'package:wellness_score_app/ui/features/health_result/health_result_screen.dart';

abstract class AppRouter {
  static const String calculator = '/';
  static const String result = '/result';

  static final router = GoRouter(
    initialLocation: calculator,
    routes: [
      GoRoute(
        path: calculator,
        builder: (context, state) => const HealthCalculatorScreen(),
      ),
      GoRoute(
        path: result,
        builder: (context, state) {
          final healthStatus = state.extra as HealthStatus;
          return HealthResultScreen(
            healthStatus: healthStatus,
          );
        },
      ),
    ],
  );
}
