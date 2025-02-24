import 'dart:developer' as developer;

import 'package:wellness_score_app/domain/repositories/analytics_repository.dart';

class MockAnalyticsRepository implements AnalyticsRepository {
  @override
  Future<void> trackEvent(String event, {Map<String, dynamic>? data}) async {
    _log(event, _LogStatusInfo(), data: data);
  }

  @override
  Future<void> reportError({required String message, Map<String, dynamic>? data}) async {
    _log(message, _LogStatusError(), data: data);
  }

  @override
  Future<void> trackAction(String actionName, {Map<String, dynamic>? data}) async {
    _log(actionName, _LogStatusInfo(), data: data);
  }

  void _log(
    String? text,
    _LogStatus status, {
    StackTrace? stackTrace,
    String? error,
    Map<String, dynamic>? data,
  }) {
    String msg = '[${status.emoji}] $text';

    if (data != null) {
      msg += '\nData $data';
    }

    if (error != null) {
      msg += '\nError $error';
    }

    if (stackTrace != null) {
      msg += '\nStackTrace $stackTrace';
    }

    developer.log('${status.color}$msg\x1B[0m', name: 'MockAnalytics');
  }
}

// https://en.wikipedia.org/wiki/ANSI_escape_code
sealed class _LogStatus {
  final String tag;
  final String emoji;
  final String color;

  _LogStatus(this.tag, this.emoji, this.color);
}

class _LogStatusInfo extends _LogStatus {
  _LogStatusInfo() : super('INFO', '✅', '\x1B[33m');
}

class _LogStatusError extends _LogStatus {
  _LogStatusError() : super('ERROR', '😡', '\x1B[91m');
}
