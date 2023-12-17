import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/core/app_colors.dart';

class AlertDialogWidget extends StatelessWidget {
  final String description;
  final String option1Text;
  final String option2Text;
  final Function() onTapOption1;
  final Function() onTapOption2;

  const AlertDialogWidget({
    super.key,
    required this.description,
    required this.option1Text,
    required this.option2Text,
    required this.onTapOption1,
    required this.onTapOption2,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: Text(
        description,
      ),
      actions: <Widget>[
        CupertinoButton(
          key: const Key("option1Button"),
          onPressed: onTapOption1,
          child: Text(option1Text),
        ),
        CupertinoButton(
          key: const Key("option2Button"),
          onPressed: onTapOption2,
          child: Text(option2Text),
        ),
      ],
    );
  }
}
