/// A repository for tracking analytics events and errors.
///
/// This interface defines methods for tracking events and errors in the application.
/// It provides a way to log user interactions, errors, and other relevant data.
///
/// Implementations of this repository should handle the actual tracking logic
/// and storage of analytics data.
abstract class AnalyticsRepository {
  Future<void> trackEvent(String eventName, {Map<String, dynamic>? data});

  Future<void> trackAction(String actionName, {Map<String, dynamic>? data});

  Future<void> reportError({required String message, Map<String, dynamic>? data});
}
