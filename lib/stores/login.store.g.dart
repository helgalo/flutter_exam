// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  late final _$userFailureAtom =
      Atom(name: '_LoginStore.userFailure', context: context);

  @override
  Observable<Failure>? get userFailure {
    _$userFailureAtom.reportRead();
    return super.userFailure;
  }

  @override
  set userFailure(Observable<Failure>? value) {
    _$userFailureAtom.reportWrite(value, super.userFailure, () {
      super.userFailure = value;
    });
  }

  late final _$passwordFailureAtom =
      Atom(name: '_LoginStore.passwordFailure', context: context);

  @override
  Observable<Failure>? get passwordFailure {
    _$passwordFailureAtom.reportRead();
    return super.passwordFailure;
  }

  @override
  set passwordFailure(Observable<Failure>? value) {
    _$passwordFailureAtom.reportWrite(value, super.passwordFailure, () {
      super.passwordFailure = value;
    });
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void verifyFields() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.verifyFields');
    try {
      return super.verifyFields();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userFailure: ${userFailure},
passwordFailure: ${passwordFailure}
    ''';
  }
}
