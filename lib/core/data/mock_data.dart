import '../../features/auth/domain/entities/user.dart';
import '../../features/products/domain/entities/product.dart';
import '../../features/products/domain/entities/category.dart';
import '../../features/sales/domain/entities/sale.dart';
import '../../features/sales/domain/entities/sale_item.dart';

/// Mock data provider for development and UI testing
/// Note: This is deprecated - using real API now
abstract class MockData {
  // ============================================
  // Mock User
  // ============================================

  static User get currentUser => const User(
    id: 1,
    name: 'John Doe',
    email: 'john.doe@stokio.com',
    role: 'cashier',
  );

  // ============================================
  // Mock Categories
  // ============================================

  static List<Category> get categories => const [
    Category(id: 1, name: 'Food', icon: '🍔', color: 0xFFEF4444),
    Category(id: 2, name: 'Beverages', icon: '🥤', color: 0xFF3B82F6),
    Category(id: 3, name: 'Snacks', icon: '🍿', color: 0xFFF59E0B),
    Category(id: 4, name: 'Desserts', icon: '🍰', color: 0xFFEC4899),
    Category(id: 5, name: 'Other', icon: '📦', color: 0xFF6B7280),
  ];

  // ============================================
  // Mock Products (empty - using API)
  // ============================================

  static List<Product> get products => [];

  // ============================================
  // Mock Sales (empty - using API)
  // ============================================

  static List<Sale> get sales => [];

  // ============================================
  // Mock Sale Items (empty - using API)
  // ============================================

  static List<SaleItem> get saleItems => [];
}
