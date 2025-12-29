/// API configuration constants
class ApiConfig {
  // Base URL - using Android emulator localhost
  static const String baseUrl = 'http://10.0.2.2:8080/api';

  // Connection timeouts
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  static const int sendTimeout = 30000; // 30 seconds

  // ============================================
  // Auth Endpoints
  // ============================================
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String verifyOtp = '/auth/verify-otp';
  static const String me = '/auth/me';

  // ============================================
  // Product Endpoints
  // ============================================
  static const String products = '/products';

  // ============================================
  // Sales Endpoints
  // ============================================
  static const String sales = '/sales';
  static String saleDetail(int id) => '/sales/$id';
  static String cancelSale(int id) => '/sales/$id/cancel';
}
