import 'package:flutter/cupertino.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/core/app_shadows.dart';

class BasicButtonWidget extends StatelessWidget {
  final Function()? onTap;
  const BasicButtonWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: AppShadows.mainShadow,
          color: AppColors.success,
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
