import 'package:flutter/material.dart';
import 'package:flutter_exam/main.dart';
import 'package:flutter_exam/widgets/snackbar_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home.store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  ObservableList<String> textList = ObservableList();

  @observable
  int? indexIsEditing;

  TextEditingController textController = TextEditingController();

  FocusNode focusNode = FocusNode();

  @action
  void onChangedListText(List<String> texts) {
    textList.insertAll(0, texts);
  }

  @action
  void addText(String text) {
    if (text.isEmpty) {
      ScaffoldMessenger.of(navigationApp.currentContext!).showSnackBar(
        SnackBarWidget(content: "O campo deve ser preenchido."),
      );
      return;
    }
    if (indexIsEditing != null) {
      textList[indexIsEditing!] = text;
    } else {
      textList.add(text);
    }
    textController.clear();
    indexIsEditing = null;

    saveAllData();
  }

  @action
  void removeText(String text) {
    if (text == textController.text) {
      textController.clear();
      focusNode.unfocus();
    }
    textList.remove(text);
    saveAllData();
  }

  @action
  void onTapEditButton(int index) {
    textController.text = textList[index];
    indexIsEditing = index;
    focusNode.requestFocus();
  }

  void saveAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('items', textList.nonObservableInner);
  }

  void getAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (textList.isNotEmpty && textList.last == '') {
      removeText(textList.last);
    }

    onChangedListText(prefs.getStringList('items') ?? []);
  }
}
