/// Represents the financial health status of a user based on their income and expenses ratio.
///
/// The status is determined by calculating the ratio between annual expenses and income:
///
/// * [healthy]: Ratio ≤ 0.25 (Using 25% or less of income)
/// * [medium]: 0.25 < Ratio ≤ 0.75 (Using between 25% and 75% of income)
/// * [low]: Ratio > 0.75 (Using more than 75% of income)
enum HealthStatus {
  healthy,
  medium,
  low;

  bool get isHealthy => this == healthy;
  bool get isMedium => this == medium;
  bool get isLow => this == low;
}
