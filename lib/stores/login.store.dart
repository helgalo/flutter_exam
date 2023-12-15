import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/main.dart';
import 'package:flutter_exam/models/failure.dart';
import 'package:mobx/mobx.dart';
part 'login.store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @observable
  Observable<Failure?> userFailure = Observable(null);
  @observable
  Observable<Failure?> passwordFailure = Observable(null);

  void onTapLogin() async {
    verifyFields();

    if (userFailure.value == null && passwordFailure.value == null) {
      Navigator.pushReplacementNamed(navigationApp.currentContext!, '/home');
    }

    //TODO: Subir snack com o erro

    return;
  }

  @action
  void verifyFields() {
    userFailure.value = hasValidUser(userController.text);
    passwordFailure.value = hasValidPassword(passwordController.text);
  }

  Failure? hasValidPassword(String? passwordText) {
    Pattern pattern = r'^[a-zA-Z0-9]+$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(passwordText!)) {
      return LoginFailures.specialCharactersPasswordFailure.failure;
    }
    if (passwordText.isEmpty) {
      return LoginFailures.emptyFieldFailure.failure;
    }
    return null;
  }

  Failure? hasValidUser(String? userText) {
    if (userText!.isEmpty) {
      return LoginFailures.emptyFieldFailure.failure;
    }
    return null;
  }
}

enum LoginFailures {
  lessThenTwoCharactersPasswordFailure,
  specialCharactersPasswordFailure,
  emptyFieldFailure,
}

extension LoginFailuresExtension on LoginFailures {
  String get description => describeEnum(this);

  Failure get failure {
    switch (this) {
      case LoginFailures.lessThenTwoCharactersPasswordFailure:
        return Failure(
          description: "O campo senha não pode ter menos que dois caracteres.",
          code: "000",
          id: 0,
        );
      case LoginFailures.specialCharactersPasswordFailure:
        return Failure(
          description:
              "O campo senha não pode ter caracteres especiais, sendo apenas possível informar 'a' até 'Z' e '0' até '9'. ",
          code: "001",
          id: 1,
        );
      case LoginFailures.emptyFieldFailure:
        return Failure(
          description: "O campo não pode estar vazio.",
          code: "002",
          id: 2,
        );
    }
  }
}
