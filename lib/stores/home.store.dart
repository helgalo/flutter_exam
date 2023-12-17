import 'package:flutter/material.dart';
import 'package:flutter_exam/main.dart';
import 'package:flutter_exam/widgets/alert_dialog_widget.dart';
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
  void onChangedTextList(List<String> texts) {
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

    saveData();
  }

  @action
  void removeText(String text) {
    if (text == textController.text) {
      textController.clear();
      focusNode.unfocus();
    }
    textList.remove(text);
    saveData();
  }

  @action
  void onTapTextEdit(int index) {
    textController.text = textList[index];
    indexIsEditing = index;
    focusNode.requestFocus();
  }

  Future<void> onTapTextRemove(String text) async {
    await showDialog(
      context: navigationApp.currentContext!,
      builder: (BuildContext context) {
        return AlertDialogWidget(
          description: "Deseja prosseguir com a deleção?",
          onTapOption1: () => Navigator.of(context).pop(true),
          onTapOption2: () {
            removeText(text);
            Navigator.of(context).pop(true);
          },
          option1Text: "Cancelar",
          option2Text: "Confirmar",
        );
      },
    );
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('items', textList.nonObservableInner);
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (textList.isNotEmpty && textList.last == '') {
      removeText(textList.last);
    }

    onChangedTextList(prefs.getStringList('items') ?? []);
  }
}
