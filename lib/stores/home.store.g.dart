// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$textListAtom =
      Atom(name: '_HomeStore.textList', context: context);

  @override
  ObservableList<String> get textList {
    _$textListAtom.reportRead();
    return super.textList;
  }

  @override
  set textList(ObservableList<String> value) {
    _$textListAtom.reportWrite(value, super.textList, () {
      super.textList = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void onChangedListText(List<String> texts) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.onChangedListText');
    try {
      return super.onChangedListText(texts);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addText(String text) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.addText');
    try {
      return super.addText(text);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeText(String text) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.removeText');
    try {
      return super.removeText(text);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textList: ${textList}
    ''';
  }
}
