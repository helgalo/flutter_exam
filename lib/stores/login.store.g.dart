// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  late final _$isValidFieldsAtom =
      Atom(name: '_LoginStore.isValidFields', context: context);

  @override
  Observable<bool> get isValidFields {
    _$isValidFieldsAtom.reportRead();
    return super.isValidFields;
  }

  @override
  set isValidFields(Observable<bool> value) {
    _$isValidFieldsAtom.reportWrite(value, super.isValidFields, () {
      super.isValidFields = value;
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
isValidFields: ${isValidFields}
    ''';
  }
}
