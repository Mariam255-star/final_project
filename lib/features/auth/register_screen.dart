import 'package:flutter/material.dart';
import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/utils/text_style.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  /// 🔹 Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  /// 🔹 States
  bool agree = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// 🔹 الخلفية العلوية
          Image.asset(
            "assets/images/Rectangle 9 top.png",
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),

          /// 🔹 اللوجو + العنوان
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 60,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Register",
                  style: TextStyles.titleLarge(color: Colors.black),
                ),
              ],
            ),
          ),

          /// 🔹 المحتوى المتحرك
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 250),
            child: Column(
              children: [
                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _textField(
                        "First Name",
                        controller: firstNameController,
                      ),
                      const SizedBox(height: 16),

                      _textField(
                        "Last Name",
                        controller: lastNameController,
                      ),
                      const SizedBox(height: 16),

                      _textField(
                        "Email Address",
                        controller: emailController,
                      ),
                      const SizedBox(height: 16),

                      _passwordField(
                        "Password",
                        controller: passwordController,
                        obscure: obscurePassword,
                        onToggle: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      const SizedBox(height: 16),

                      _passwordField(
                        "Confirm Password",
                        controller: confirmPasswordController,
                        obscure: obscureConfirmPassword,
                        onToggle: () {
                          setState(() {
                            obscureConfirmPassword =
                                !obscureConfirmPassword;
                          });
                        },
                      ),

                      const SizedBox(height: 12),

                      /// 🔹 Checkbox
                      Row(
                        children: [
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: Checkbox(
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = value!;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              "Agree to our Terms & Condition",
                              style: TextStyles.caption(),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      /// 🔹 زرار التسجيل
                      _mainButton(),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// 🔹 الجزء الأخضر السفلي
                Image.asset(
                  "assets/images/Rectangle 20.png",
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          /// ⬅️ السهم (لازم يكون آخر عنصر)
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    context.go('/welcome');
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= Widgets =================

  Widget _textField(
    String hint, {
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.caption(),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  Widget _passwordField(
    String hint, {
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.caption(),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            size: 18,
          ),
          onPressed: onToggle,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  Widget _mainButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          disabledBackgroundColor: AppColor.primaryColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        onPressed: agree ? _register : null,
        child: Text(
          "Sign Up",
          style: TextStyles.button(color: Colors.white),
        ),
      ),
    );
  }

  /// 🔹 Register Logic
  void _register() {
    if (passwordController.text !=
        confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    print("Register Success");
  }
}
