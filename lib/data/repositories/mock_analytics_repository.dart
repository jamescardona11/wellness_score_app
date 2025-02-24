import 'package:wellness_score_app/domain/repositories/analytics_repository.dart';

class MockAnalyticsRepository implements AnalyticsRepository {
  @override
  Future<void> trackEvent(String event, {Map<String, dynamic>? data}) async {
    // TODO: implement trackEvent
    throw UnimplementedError();
  }

  @override
  Future<void> reportError({required String message, Map<String, dynamic>? data}) async {
    // TODO: implement reportError
    throw UnimplementedError();
  }

  @override
  Future<void> trackAction(String actionName, {Map<String, dynamic>? data}) async {
    // TODO: implement trackAction
    throw UnimplementedError();
  }
}
