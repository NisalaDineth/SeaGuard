import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'tab_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF2E7D8E),
                  const Color(0xFF1E5A6B),
                  if (isDarkMode)
                    const Color(0xFF0A0A0A)
                  else
                    const Color(0xFFF5F9FA),
                ],
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Header with Logo
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/logo.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // App Name and Tagline
                        Text(
                          'SeaGuard',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'NotoSans',
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          'Join us in protecting our oceans',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.9),
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Action Buttons
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Get Started Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () => _showAuthBottomSheet(
                              context,
                              authController,
                              true,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF2E7D8E),
                              elevation: 8,
                              shadowColor: Colors.black.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'NotoSans',
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: OutlinedButton(
                            onPressed: () => _showAuthBottomSheet(
                              context,
                              authController,
                              false,
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'NotoSans',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAuthBottomSheet(
    BuildContext context,
    AuthController controller,
    bool isSignUp,
  ) {
    controller.setAuthMode(isSignUp);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AuthBottomSheet(controller: controller),
    );
  }
}

class AuthBottomSheet extends StatelessWidget {
  final AuthController controller;

  const AuthBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Obx(
        () => Column(
          children: [
            // Handle Bar
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header with Toggle
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Tab Selector
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: (isDarkMode ? Colors.grey[800] : Colors.grey[100]),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => controller.setAuthMode(true),
                            child: Container(
                              height: 46,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: controller.isSignUp.value
                                    ? const Color(0xFF2E7D8E)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(23),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: controller.isSignUp.value
                                        ? Colors.white
                                        : (isDarkMode
                                              ? Colors.grey[300]
                                              : Colors.grey[700]),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'NotoSans',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => controller.setAuthMode(false),
                            child: Container(
                              height: 46,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: !controller.isSignUp.value
                                    ? const Color(0xFF2E7D8E)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(23),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: !controller.isSignUp.value
                                        ? Colors.white
                                        : (isDarkMode
                                              ? Colors.grey[300]
                                              : Colors.grey[700]),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'NotoSans',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Form Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: controller.isSignUp.value
                    ? _buildSignUpForm(context, controller, isDarkMode)
                    : _buildSignInForm(context, controller, isDarkMode),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpForm(
    BuildContext context,
    AuthController controller,
    bool isDarkMode,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Account',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.grey[800],
            fontFamily: 'NotoSans',
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Join SeaGuard to make a difference',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontFamily: 'NotoSans',
          ),
        ),

        const SizedBox(height: 32),

        // Name Field
        _buildTextField(
          controller: controller.nameController,
          label: 'Full Name',
          icon: Icons.person_outline,
          isDarkMode: isDarkMode,
        ),

        const SizedBox(height: 20),

        // Email Field
        _buildTextField(
          controller: controller.emailController,
          label: 'Email Address',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          isDarkMode: isDarkMode,
        ),

        const SizedBox(height: 20),

        // Password Field
        Obx(
          () => _buildTextField(
            controller: controller.passwordController,
            label: 'Password',
            icon: Icons.lock_outline,
            obscureText: controller.obscurePassword.value,
            isDarkMode: isDarkMode,
            suffixIcon: IconButton(
              icon: Icon(
                controller.obscurePassword.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey[600],
              ),
              onPressed: () => controller.togglePasswordVisibility(),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Confirm Password Field
        Obx(
          () => _buildTextField(
            controller: controller.confirmPasswordController,
            label: 'Confirm Password',
            icon: Icons.lock_outline,
            obscureText: controller.obscureConfirmPassword.value,
            isDarkMode: isDarkMode,
            suffixIcon: IconButton(
              icon: Icon(
                controller.obscureConfirmPassword.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey[600],
              ),
              onPressed: () => controller.toggleConfirmPasswordVisibility(),
            ),
          ),
        ),

        const SizedBox(height: 32),

        // Sign Up Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () => _handleSignUp(context, controller),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D8E),
              foregroundColor: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'NotoSans',
              ),
            ),
          ),
        ),

        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildSignInForm(
    BuildContext context,
    AuthController controller,
    bool isDarkMode,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.grey[800],
            fontFamily: 'NotoSans',
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Sign in to continue your ocean journey',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontFamily: 'NotoSans',
          ),
        ),

        const SizedBox(height: 32),

        // Email Field
        _buildTextField(
          controller: controller.emailController,
          label: 'Email Address',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          isDarkMode: isDarkMode,
        ),

        const SizedBox(height: 20),

        // Password Field
        Obx(
          () => _buildTextField(
            controller: controller.passwordController,
            label: 'Password',
            icon: Icons.lock_outline,
            obscureText: controller.obscurePassword.value,
            isDarkMode: isDarkMode,
            suffixIcon: IconButton(
              icon: Icon(
                controller.obscurePassword.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey[600],
              ),
              onPressed: () => controller.togglePasswordVisibility(),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Forgot Password
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => _handleForgotPassword(context, controller),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: const Color(0xFF2E7D8E),
                fontWeight: FontWeight.w600,
                fontFamily: 'NotoSans',
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Sign In Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () => _handleSignIn(context, controller),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D8E),
              foregroundColor: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'NotoSans',
              ),
            ),
          ),
        ),

        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    required bool isDarkMode,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.grey[800],
        fontFamily: 'NotoSans',
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600], fontFamily: 'NotoSans'),
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2E7D8E), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  void _handleSignUp(BuildContext context, AuthController controller) {
    // Basic validation
    if (controller.nameController.text.trim().isEmpty ||
        controller.emailController.text.trim().isEmpty ||
        controller.passwordController.text.trim().isEmpty ||
        controller.confirmPasswordController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (controller.passwordController.text !=
        controller.confirmPasswordController.text) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Navigate to TabScreen
    Get.off(() => const TabScreen());
  }

  void _handleSignIn(BuildContext context, AuthController controller) {
    // Basic validation
    if (controller.emailController.text.trim().isEmpty ||
        controller.passwordController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Navigate to TabScreen
    Get.off(() => const TabScreen());
  }

  void _handleForgotPassword(BuildContext context, AuthController controller) {
    Get.snackbar(
      'Forgot Password',
      'Password reset link will be sent to your email',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2E7D8E),
      colorText: Colors.white,
    );
  }
}
