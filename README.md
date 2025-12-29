# 🛒 Stokio POS Mobile

A modern, premium Point of Sale (POS) mobile application built with Flutter for cashiers and retail staff. Stokio POS provides a seamless and intuitive interface for managing sales transactions, product browsing, and sales history tracking.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.8+-0175C2?logo=dart)
![Riverpod](https://img.shields.io/badge/Riverpod-3.x-00D084)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📱 Overview

Stokio POS Mobile is the cashier-facing mobile application of the Stokio inventory and point-of-sale ecosystem. It connects to the [Stokio Backend API](https://github.com/arkefallen/stokio-backend) to provide real-time product data, seamless transaction processing, and comprehensive sales tracking.

### Key Highlights

- **Premium UI/UX**: Modern, clean design with smooth animations and intuitive navigation
- **Real-time Sync**: Connects to backend API for up-to-date product and sales data
- **Offline-Ready Architecture**: Built with state management that supports future offline capabilities
- **Secure Authentication**: JWT-based authentication with secure token storage

---

## ✨ Features

### 🔐 Authentication
- Email/Password login with secure token handling
- OTP verification support
- Auto-login with stored credentials
- Session management with automatic token refresh

### 🛍️ Point of Sale
- Browse products with category filtering
- Real-time search functionality
- Add items to cart with quantity management
- Multiple payment method support (Cash, Card, QRIS, Transfer)
- Quick checkout with confirmation dialogs

### 🛒 Cart Management
- Add/remove items from cart
- Adjust item quantities
- Real-time total calculation
- Swipe-to-delete functionality
- Persistent cart state

### 📊 Sales History
- View complete sales history
- Filter by date and status
- Detailed transaction view
- Cancel sales functionality
- Today's sales summary

### ⚙️ Settings
- User profile display
- App version information
- Logout functionality

---

## 🏗️ Architecture

The application follows **Clean Architecture** principles with a feature-first folder structure:

```
lib/
├── core/                          # Shared utilities and components
│   ├── constants/                 # App dimensions, colors, typography
│   ├── network/                   # API configuration, Dio client, interceptors
│   ├── storage/                   # Secure storage management
│   ├── theme/                     # App theming (light/dark)
│   ├── utils/                     # Utility classes (formatters, result wrapper)
│   └── widgets/                   # Reusable UI components
│
├── features/                      # Feature modules
│   ├── auth/                      # Authentication feature
│   │   ├── data/                  # DTOs, repositories implementation
│   │   ├── domain/                # Entities, repository interfaces
│   │   └── presentation/          # Screens, state management
│   │
│   ├── products/                  # Products feature
│   │   ├── domain/                # Product, Category entities
│   │   └── presentation/          # Product widgets, notifiers
│   │
│   ├── cart/                      # Cart feature
│   │   ├── domain/                # CartItem entity
│   │   └── presentation/          # Cart UI, cart state
│   │
│   ├── sales/                     # Sales feature
│   │   ├── data/                  # Sale DTOs
│   │   ├── domain/                # Sale, SaleItem entities
│   │   └── presentation/          # Sales screens, notifiers
│   │
│   └── dashboard/                 # Dashboard/main navigation
│       ├── pages/                 # Dashboard page with navigation
│       └── screens/               # POS, Sales, Settings screens
│
└── main.dart                      # App entry point
```

### Architecture Layers

| Layer | Purpose | Example |
|-------|---------|---------|
| **Presentation** | UI components, State management | `LoginScreen`, `ProductNotifier` |
| **Domain** | Business entities, Repository interfaces | `Product`, `Sale`, `AuthRepository` |
| **Data** | API implementations, DTOs | `AuthRepositoryImpl`, `CreateSaleRequest` |

---

## 🔧 Tech Stack

| Category | Technology |
|----------|------------|
| **Framework** | Flutter 3.x |
| **Language** | Dart 3.8+ |
| **State Management** | Riverpod 3.x with Code Generation |
| **Networking** | Dio 5.x |
| **Data Classes** | Freezed + JSON Serializable |
| **Secure Storage** | Flutter Secure Storage |
| **Animations** | Flutter Animate |
| **Icons** | Phosphor Icons |
| **Date Formatting** | intl |

---

## 🗂️ State Management

The app uses **Riverpod** with code generation for type-safe, scalable state management.

### Provider Types Used

| Provider Type | Use Case | Example |
|---------------|----------|---------|
| `@Riverpod` Notifier | Complex state with methods | `AuthNotifier`, `ProductNotifier` |
| `@riverpod` | Computed/derived state | `isAuthenticated`, `currentUser` |
| `Provider` | Simple singletons | `dioProvider`, `secureStorageProvider` |

### State Flow Example

```dart
// 1. Define state notifier with code generation
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    _checkInitialAuthState();
    return const AuthState.initial();
  }
  
  Future<void> login({required String email, required String password}) async {
    state = const AuthState.loading();
    final result = await _repository.login(email: email, password: password);
    state = result.fold(
      onSuccess: (response) => AuthState.authenticated(response.user),
      onError: (e) => AuthState.error(e.message),
    );
  }
}

// 2. Watch state in UI
class LoginScreen extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    
    return authState.when(
      initial: () => LoginForm(),
      loading: () => LoadingIndicator(),
      authenticated: (user) => Dashboard(),
      error: (message) => ErrorWidget(message),
    );
  }
}
```

---

## 🌐 API Integration

The app connects to the Stokio Backend API with the following configuration:

### Base URL Configuration

```dart
// lib/core/network/api_config.dart
class ApiConfig {
  // For Android Emulator (localhost:8080 → 10.0.2.2:8080)
  static const String baseUrl = 'http://10.0.2.2:8080/api';
  
  // Endpoints
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String products = '/products';
  static const String sales = '/sales';
  // ...
}
```

### Authentication Flow

1. User enters credentials
2. App sends POST to `/auth/login`
3. On success, token is stored in secure storage
4. `AuthInterceptor` automatically attaches Bearer token to requests
5. On 401 response, token is cleared and user redirected to login

### Request/Response Handling

```dart
// Dio interceptor automatically adds auth token
class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, handler) async {
    final token = await _storage.read(key: tokenKey);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.x or higher
- Dart SDK 3.8 or higher
- Android Studio / VS Code with Flutter extensions
- Running instance of [Stokio Backend](https://github.com/arkefallen/stokio-backend)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/arkefallen/stokio-pos-mobile.git
   cd stokio-pos-mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (Riverpod, Freezed, JSON Serializable)
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Configure API URL**
   
   Edit `lib/core/network/api_config.dart`:
   ```dart
   // For Android Emulator with localhost backend
   static const String baseUrl = 'http://10.0.2.2:8080/api';
   
   // For physical device (use your machine's IP)
   // static const String baseUrl = 'http://192.168.x.x:8080/api';
   
   // For production
   // static const String baseUrl = 'https://api.stokio.com/api';
   ```

5. **Run the app**
   ```bash
   # Run on connected device/emulator
   flutter run
   
   # Run in debug mode with hot reload
   flutter run --debug
   
   # Run in release mode
   flutter run --release
   ```

### Build APK

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# Split APK by ABI (smaller size)
flutter build apk --split-per-abi
```

---

## 🧪 Development

### Code Generation

After modifying files with `@freezed`, `@riverpod`, or `@JsonSerializable` annotations:

```bash
# One-time build
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-rebuild on changes)
dart run build_runner watch --delete-conflicting-outputs
```

### Code Analysis

```bash
# Run Flutter analyzer
flutter analyze

# Fix auto-fixable issues
dart fix --apply
```

### Project Structure Commands

```bash
# List all Dart files
find lib -name "*.dart" | head -20

# Count lines of code
find lib -name "*.dart" | xargs wc -l | tail -1
```

---

## 📋 API Endpoints Reference

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/login` | User login |
| POST | `/auth/logout` | User logout |
| GET | `/auth/me` | Get current user |
| GET | `/products` | List all products |
| GET | `/products/{id}` | Get product details |
| GET | `/sales` | List all sales |
| POST | `/sales` | Create new sale |
| GET | `/sales/{id}` | Get sale details |
| POST | `/sales/{id}/cancel` | Cancel a sale |

---

<p align="center">
  Made with ❤️ using Flutter
</p>
