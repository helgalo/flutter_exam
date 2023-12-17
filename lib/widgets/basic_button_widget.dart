import 'package:flutter/cupertino.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/core/app_shadows.dart';

class BasicButtonWidget extends StatelessWidget {
  final String title;
  final double? width;
  final double borderRadius;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Function()? onTap;
  const BasicButtonWidget({
    super.key,
    this.onTap,
    this.width,
    this.borderRadius = 100,
    this.textStyle = const TextStyle(
      color: AppColors.white,
      fontSize: 12,
    ),
    this.backgroundColor = AppColors.white,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          boxShadow: AppShadows.mainShadow,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 48,
            vertical: 10,
          ),
          child: Center(
            child: Text(
              title,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
