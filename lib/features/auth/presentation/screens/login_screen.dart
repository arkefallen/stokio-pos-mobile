import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/core.dart';
import '../../../dashboard/pages/dashboard_page.dart';
import '../state/auth_notifier.dart';
import '../state/auth_state.dart';

/// Premium Login Screen for Stokio POS
/// Features: Email/Password login, Google sign-in button (UI only), OTP handling
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(authNotifierProvider.notifier).login(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );
    }
  }

  void _handleVerifyOtp() {
    if (_otpController.text.length == 6) {
      ref.read(authNotifierProvider.notifier).verifyOtp(_otpController.text);
    }
  }

  void _handleGoogleSignIn() {
    // TODO: Implement Google Sign-In
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Google Sign-In coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    // Update loading state
    _isLoading = authState is AuthStateLoading;
        ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is AuthStateAuthenticated) {
        // Navigate to dashboard on successful login
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const DashboardPage()),
          (route) => false,
        );
      } else if (next is AuthStateError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimens.spacing24),
            child: authState is AuthStateOtpRequired
                ? _buildOtpForm(context)
                : _buildLoginForm(context),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo and branding
          _buildLogo()
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: -0.3, end: 0, duration: 600.ms),

          const SizedBox(height: AppDimens.spacing48),

          // Welcome text
          Text(
            'Welcome Back',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimaryLight,
                ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 200.ms, duration: 400.ms),

          const SizedBox(height: AppDimens.spacing8),

          Text(
            'Sign in to continue to Stokio POS',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 300.ms, duration: 400.ms),

          const SizedBox(height: AppDimens.spacing40),

          // Email field
          _buildEmailField()
              .animate()
              .fadeIn(delay: 400.ms, duration: 400.ms)
              .slideX(begin: -0.1, end: 0),

          const SizedBox(height: AppDimens.spacing16),

          // Password field
          _buildPasswordField()
              .animate()
              .fadeIn(delay: 500.ms, duration: 400.ms)
              .slideX(begin: -0.1, end: 0),

          const SizedBox(height: AppDimens.spacing8),

          // Forgot password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // TODO: Navigate to forgot password
              },
              child: Text(
                'Forgot Password?',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ).animate().fadeIn(delay: 550.ms, duration: 400.ms),

          const SizedBox(height: AppDimens.spacing24),

          // Login button
          _buildLoginButton()
              .animate()
              .fadeIn(delay: 600.ms, duration: 400.ms)
              .slideY(begin: 0.1, end: 0),

          const SizedBox(height: AppDimens.spacing24),

          // Divider with "OR"
          _buildDivider(context)
              .animate()
              .fadeIn(delay: 700.ms, duration: 400.ms),

          const SizedBox(height: AppDimens.spacing24),

          // Google sign-in button
          _buildGoogleButton()
              .animate()
              .fadeIn(delay: 800.ms, duration: 400.ms)
              .slideY(begin: 0.1, end: 0),
        ],
      ),
    );
  }

  Widget _buildOtpForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Back button
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).clearError();
            },
            icon: const Icon(PhosphorIconsRegular.arrowLeft),
          ),
        ),

        const SizedBox(height: AppDimens.spacing24),

        // Lock icon
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            PhosphorIconsBold.shieldCheck,
            size: 40,
            color: AppColors.primary,
          ),
        ),

        const SizedBox(height: AppDimens.spacing24),

        Text(
          'Verify OTP',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimaryLight,
              ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppDimens.spacing8),

        Text(
          'Enter the 6-digit code sent to your email',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondaryLight,
              ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppDimens.spacing32),

        // OTP input
        TextFormField(
          controller: _otpController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 6,
          style: AppTypography.priceHero(),
          decoration: InputDecoration(
            counterText: '',
            hintText: '000000',
            hintStyle: AppTypography.priceHero().copyWith(
              color: AppColors.textTertiaryLight,
            ),
          ),
          onChanged: (value) {
            if (value.length == 6) {
              _handleVerifyOtp();
            }
          },
        ),

        const SizedBox(height: AppDimens.spacing32),

        // Verify button
        ElevatedButton(
          onPressed: _isLoading ? null : _handleVerifyOtp,
          child: _isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : const Text('Verify'),
        ),

        const SizedBox(height: AppDimens.spacing16),

        // Resend OTP
        TextButton(
          onPressed: () {
            // TODO: Implement resend OTP
          },
          child: const Text("Didn't receive code? Resend"),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
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
            PhosphorIconsBold.storefront,
            size: 48,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: AppDimens.spacing16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Stokio',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
            ),
            Text(
              ' POS',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondary,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      enabled: !_isLoading,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        prefixIcon: Icon(PhosphorIconsRegular.envelope),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      textInputAction: TextInputAction.done,
      enabled: !_isLoading,
      onFieldSubmitted: (_) => _handleLogin(),
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        prefixIcon: const Icon(PhosphorIconsRegular.lock),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          icon: Icon(
            _obscurePassword
                ? PhosphorIconsRegular.eye
                : PhosphorIconsRegular.eyeSlash,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        boxShadow: _isLoading ? null : AppTheme.buttonShadow,
      ),
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleLogin,
        child: _isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text('Sign In'),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing16),
          child: Text(
            'OR',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textTertiaryLight,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildGoogleButton() {
    return OutlinedButton(
      onPressed: _isLoading ? null : _handleGoogleSignIn,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.borderLight, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Google icon placeholder (using phosphor icon as substitute)
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              PhosphorIconsBold.googleLogo,
              size: 20,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(width: AppDimens.spacing12),
          Text(
            'Continue with Google',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.textPrimaryLight,
                ),
          ),
        ],
      ),
    );
  }
}
