import 'package:flutter/material.dart';
import 'package:flutter_exam/core/app_colors.dart';

class SnackBarWidget extends SnackBar {
  SnackBarWidget({
    super.key,
    required String content,
    double borderRadius = 12.0,
  }) : super(
          content: Center(child: Text(content)),
          backgroundColor: AppColors.error,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        );
}
