import 'package:flutter/material.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/views/login/login_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.secondaryColor,
              AppColors.mainColor,
            ],
          ),
        ),
        child: const Center(
          child: LoginView(),
        ),
      ),
    );
  }
}
