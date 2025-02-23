abstract class AnalyticsRepository {
  Future<void> trackEvent(String eventName, {Map<String, dynamic>? data});

  Future<void> trackAction(String actionName, {Map<String, dynamic>? data});

  Future<void> reportError({required String message, Map<String, dynamic>? data});
}
