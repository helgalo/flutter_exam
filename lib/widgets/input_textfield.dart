import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/core/app_shadows.dart';

class InputTextField extends StatefulWidget {
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final IconData? leadingIcon;
  final TextFieldType styleType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isObscure;

  const InputTextField({
    super.key,
    this.controller,
    this.height,
    this.width,
    this.styleType = TextFieldType.primary,
    this.leadingIcon,
    this.inputFormatters,
    this.isObscure = false,
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 320),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        boxShadow: AppShadows.mainShadow,
        borderRadius: BorderRadius.circular(4),
        color: widget.styleType.theme.backgroundColor,
        border: widget.styleType.theme.borderColor != null
            ? Border.all(
                color: widget.styleType.theme.borderColor!,
                strokeAlign: BorderSide.strokeAlignCenter)
            : null,
      ),
      child: Row(
        children: [
          if (widget.leadingIcon != null)
            Row(
              children: [
                const SizedBox(width: 12),
                Icon(
                  widget.leadingIcon,
                  size: 18,
                  color: widget.styleType.theme.leadingIconColor,
                ),
              ],
            ),
          Expanded(
            child: TextField(
              obscureText: widget.isObscure,
              inputFormatters: widget.inputFormatters,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                isDense: true,
                border: InputBorder.none,
              ),
              controller: widget.controller,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldTypeTheme {
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? leadingIconColor;

  TextFieldTypeTheme({
    this.borderColor,
    this.backgroundColor,
    this.leadingIconColor = AppColors.black,
  });
}

enum TextFieldType {
  primary,
  error,
}

extension TextFieldTypeExtension on TextFieldType {
  String get description => describeEnum(this);

  TextFieldTypeTheme get theme {
    switch (this) {
      case TextFieldType.primary:
        return TextFieldTypeTheme(
          backgroundColor: AppColors.white,
        );
      case TextFieldType.error:
        return TextFieldTypeTheme(
          leadingIconColor: AppColors.error,
          borderColor: AppColors.error,
          backgroundColor: AppColors.white,
        );
    }
  }
}
