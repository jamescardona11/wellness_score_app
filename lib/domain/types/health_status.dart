enum HealthStatus {
  healthy,
  medium,
  low;

  bool get isHealthy => this == healthy;
  bool get isMedium => this == medium;
  bool get isLow => this == low;
}
