import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/core/app_colors.dart';
import 'package:flutter_exam/stores/login.store.dart';
import 'package:flutter_exam/views/login/widgets/basic_button.dart';
import 'package:flutter_exam/widgets/input_textfield.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static LoginStore store = LoginStore();

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
                const SizedBox(),
                Observer(
                  builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inputField(
                        title: "Usuário",
                        icon: Icons.person,
                        controller: store.userController,
                        key: const Key("userField"),
                        type: store.userFailure.value != null
                            ? TextFieldType.error
                            : TextFieldType.primary,
                      ),
                      const SizedBox(height: 12),
                      inputField(
                        title: "Senha",
                        icon: Icons.lock,
                        isObscure: true,
                        controller: store.passwordController,
                        key: const Key("passwordField"),
                        type: store.passwordFailure.value != null
                            ? TextFieldType.error
                            : TextFieldType.primary,
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: BasicButtonWidget(onTap: store.onTapLogin),
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: const Text(
                    "Política de Privacidade",
                    style: TextStyle(color: AppColors.white, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField({
    required String title,
    required Key key,
    required IconData icon,
    required TextEditingController controller,
    TextFieldType type = TextFieldType.primary,
    bool isObscure = false,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              title,
              style: const TextStyle(color: AppColors.white),
            ),
          ),
          const SizedBox(height: 4),
          InputTextField(
            key: key,
            controller: controller,
            leadingIcon: icon,
            isObscure: isObscure,
            styleType: type,
          ),
        ],
      );
}
