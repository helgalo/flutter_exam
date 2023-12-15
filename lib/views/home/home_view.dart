import 'package:flutter/cupertino.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/views/login/widgets/basic_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, columnConstrains) => SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: columnConstrains.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 24),
                    Container(
                      color: AppColors.white,
                      height: columnConstrains.maxHeight - 90,
                    ),
                    const SizedBox(height: 24),
                    BasicButtonWidget(
                      width: double.infinity,
                      title: 'Digite seu texto',
                      borderRadius: 4,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      //TODO:
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
