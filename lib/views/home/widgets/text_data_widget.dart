import 'package:flutter/material.dart';
import 'package:flutter_exam/core/app_colors.dart';

class TextDataWidget extends StatelessWidget {
  final Function() onTapEditButton;
  final Function() onTapRemoveButton;
  final String textData;
  final double width;

  const TextDataWidget({
    super.key,
    required this.onTapEditButton,
    required this.onTapRemoveButton,
    required this.textData,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 48,
          width: width,
          child: Center(
            child: Text(
              key: const Key("textData"),
              textData,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: IconButton(
                key: const Key("editButton"),
                padding: EdgeInsets.zero,
                onPressed: onTapEditButton,
                icon: const Icon(
                  Icons.edit,
                ),
              ),
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: IconButton(
                key: const Key("removeButton"),
                padding: EdgeInsets.zero,
                onPressed: onTapRemoveButton,
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: AppColors.error,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
