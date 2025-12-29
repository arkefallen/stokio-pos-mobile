import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/core.dart';
import 'features/auth/auth.dart';
import 'features/dashboard/pages/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize locale data for date formatting
  await initializeDateFormatting();

  runApp(
    const ProviderScope(
      child: StokioApp(),
    ),
  );
}

/// Root application widget
class StokioApp extends StatelessWidget {
  const StokioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stokio POS',
      debugShowCheckedModeBanner: false,

      // Theme configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Default to light mode

      // Auth-based routing
      home: const AuthRouter(),
    );
  }
}

/// Router widget that shows appropriate screen based on auth state
class AuthRouter extends ConsumerWidget {
  const AuthRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return AnimatedSwitcher(
      duration: AppDimens.animationNormal,
      child: authState.when(
        initial: () => const _SplashScreen(),
        loading: () => const _SplashScreen(),
        authenticated: (user) => const DashboardPage(),
        unauthenticated: () => const LoginScreen(),
        otpRequired: (tempToken, message) => const LoginScreen(),
        error: (message) => const LoginScreen(),
      ),
    );
  }
}

/// Splash screen shown during auth check
class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primary, AppColors.primaryDark],
                  ),
                  borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                  boxShadow: AppTheme.cardShadowElevated,
                ),
                child: const Icon(
                  Icons.point_of_sale_rounded,
                  size: 64,
                  color: Colors.white,
                ),
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                  duration: 1500.ms, color: Colors.white.withValues(alpha: 0.3)),

              const SizedBox(height: AppDimens.spacing24),

              // App name
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Stokio',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    ' POS',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ).animate().fadeIn(delay: 300.ms, duration: 600.ms),

              const SizedBox(height: AppDimens.spacing48),

              // Loading indicator
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary.withValues(alpha: 0.7),
                  ),
                ),
              ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
            ],
          ),
        ),
      ),
    );
  }
}

/// Mock auth provider for demo purposes
/// This automatically logs in with mock user data for UI testing
final mockAuthProvider = Provider<bool>((ref) {
  // Auto-login with mock data after a delay
  Future.delayed(const Duration(seconds: 1), () {
    // Note: In production, this would be replaced with actual auth flow
  });
  return true;
});
