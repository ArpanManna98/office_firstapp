// import 'package:firstapp/objectbox.g.dart';
// import 'package:firstapp/const/const.dart';
// import 'package:flutter/material.dart';
// import 'package:mobx/mobx.dart';
// import 'package:firstapp/models/model.dart';
// import 'package:firstapp/main.dart';
// import 'package:objectbox/objectbox.dart';
import 'package:firstapp/const/const.dart';
import 'package:firstapp/locator.dart';
// import 'package:firstapp/main.dart';
import 'package:firstapp/models/model.dart';
// import 'package:firstapp/objectbox.g.dart' as ob;
import 'package:firstapp/repository/login_repo.dart';
import 'package:firstapp/repository/preference_repo.dart';
import 'package:mobx/mobx.dart';
import 'package:collection/collection.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  bool loading = false;
  @observable
  String? showToast;

  final loginRepo = dependency<LoginRepo>();
final prefs = dependency<PreferenceRepo>();
  @observable
  bool isPageChange = false;
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  @action
  Future login() async {
    // debugPrint("login Clicked");

    var email = emailController.text;
    var password = passwordController.text;
    var query = await loginRepo.login(email, password);
  // SharedPreferences pref =await SharedPreferences.getInstance();
   prefs.setEmail( email);
    // ob.Query<User> query = objectbox
    //     .box<User>()
    //     .query(
    //         ob.User_.email.equals(email) & ob.User_.password.equals(password))
    //     .build();
    // List<User> verifieduser = query.find();
    List<User> result = query.find();

    var verifieduser = result.firstWhereOrNull((element) =>
        element.email?.toLowerCase() == email.toLowerCase() &&
        element.password?.toLowerCase() == password.toLowerCase());
    // debugPrint("verifieduser ${verifieduser.length}");
    // verifieduser!.forEach((element) {
    //   debugPrint("user ${element.email}  ${element.name}");
    // });
    if (verifieduser == null) {
      loading = true;
      Future.delayed(const Duration(seconds: 2));
      loading = false;
      isLoggedIn = false;
      isPageChange = false;
      showToast = "Login Failed!!";
      debugPrint("Not a verified user");
    } else {
      loading = true;
      Future.delayed(const Duration(seconds: 2));
      loading = false;
      isLoggedIn = true;
      isPageChange = true;
      showToast = "Login Success!!";
      result.forEach((element) {
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
