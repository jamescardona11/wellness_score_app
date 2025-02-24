import 'package:get_it/get_it.dart';
import 'package:wellness_score_app/data/repositories/mock_analytics_repository.dart';
import 'package:wellness_score_app/domain/repositories/analytics_repository.dart';
import 'package:wellness_score_app/domain/use_cases/health_score_use_case.dart';
import 'package:wellness_score_app/ui/features/health_calculator/cubit/health_calculator_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  _setupRepositories();
  _setupCubit();
}

void _setupRepositories() {
  getIt.registerLazySingleton<AnalyticsRepository>(() => MockAnalyticsRepository());
}

void _setupCubit() {
  getIt.registerFactory<HealthCalculatorCubit>(
    () => HealthCalculatorCubit(
      healthScoreUseCase: HealthScoreUseCase(
        getIt<AnalyticsRepository>(),
      ),
    ),
  );
}
