import 'package:mobx/mobx.dart';
part 'login_store.g.dart';
class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {
  @observable
  bool loading = false;
  bool isPageChange = false;

  @action
  void login() {
    loading = true;
    Future.delayed(const Duration(seconds: 2));
    loading = false;
    // isLoggedIn = true;
    isPageChange = true;
  }
   @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

   @computed
  bool get isFormValid => email.length > 6 && password.length > 6;

  @observable
  bool isLoggedIn = false;
}
