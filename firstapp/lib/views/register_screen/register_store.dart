import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {

   @observable
  bool isPageChange = false;
   @observable
  bool loading = false;
@action
  void signup() {
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
@observable
  String name = "";

  @action
  void setName(String value) => name = value;

  @computed
  bool get isFormValid => email.length > 6 && password.length > 6; 

}
