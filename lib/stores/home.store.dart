import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home.store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  ObservableList<String> textList = ObservableList();

  @action
  void onChangedListText(List<String> texts) {
    textList.insertAll(0, texts);
  }

  @action
  void addText(String text) {
    textList.add(text);
  }

  @action
  void removeText(String text) {
    textList.remove(text);
  }

  void saveAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (textList.last == '') {
      removeText(textList.last);
    }

    await prefs.setStringList('items', textList.nonObservableInner);
  }

  void getAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (textList.isNotEmpty && textList.last == '') {
      removeText(textList.last);
    }

    onChangedListText(prefs.getStringList('items') ?? []);
  }
}
