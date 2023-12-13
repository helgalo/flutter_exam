import 'package:mobx/mobx.dart';
part 'login.store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  Observable<bool> isValidFields = Observable(false);

  @action
  void verifyFields() {
    isValidFields.value = true;
  }
}
