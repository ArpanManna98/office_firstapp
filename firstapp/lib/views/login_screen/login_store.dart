// import 'package:firstapp/objectbox.g.dart';
// import 'package:firstapp/const/const.dart';
// import 'package:flutter/material.dart';
// import 'package:mobx/mobx.dart';
// import 'package:firstapp/models/model.dart';
// import 'package:firstapp/main.dart';
// import 'package:objectbox/objectbox.dart';
import 'package:firstapp/const/const.dart';
import 'package:firstapp/main.dart';
import 'package:firstapp/models/model.dart';
import 'package:firstapp/objectbox.g.dart' as ob;
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  bool isPageChange = false;
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  @action
  void login() {
    debugPrint("login Clicked");
    var email = emailController.text;
    var password = passwordController.text;

    ob.Query<User> query = objectbox
        .box<User>()
        .query(
            ob.User_.email.equals(email) & ob.User_.password.equals(password))
        .build();
    List<User> verifieduser = query.find();

    debugPrint("verifieduser ${verifieduser.length}");
    verifieduser.forEach((element) {
      debugPrint("user ${element.email}  ${element.name}");
    });
    if (verifieduser.length == 0) {
      loading = true;
      Future.delayed(const Duration(seconds: 2));
      loading = false;
      isLoggedIn = false;
      isPageChange = false;
      debugPrint("Not a verified user");
    } else {
      loading = true;
      Future.delayed(const Duration(seconds: 2));
      loading = false;
      isLoggedIn = true;
      isPageChange = true;
      verifieduser.forEach((element) {
      debugPrint("Welcome  ${element.name} ${element.email} ");
    });
    }
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
