import 'package:flutter/cupertino.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/core/app_shadows.dart';

class BasicButtonWidget extends StatelessWidget {
  const BasicButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: AppShadows.mainShadow,
          color: const Color(0xFF44BD6E),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 48,
            vertical: 10,
          ),
          child: Text(
            "Entrar",
            style: TextStyle(color: AppColors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
