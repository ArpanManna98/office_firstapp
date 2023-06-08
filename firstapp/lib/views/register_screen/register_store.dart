import 'package:firstapp/const/const.dart';
import 'package:firstapp/main.dart';
import 'package:firstapp/models/model.dart';
import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  bool isPageChange = false;
  @observable
  bool loading = false;
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController nameController = TextEditingController();

  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  @action
  void signup() {
    loading = true;
    var email = emailController.text;
    var password = passwordController.text;
    var name = nameController.text;
    Future.delayed(const Duration(seconds: 2));
    loading = false;
    // isLoggedIn = true;
    User user =
        User(name: name, email: email, password: password, uid: idGenerator());
    objectbox.box<User>().put(user);
    // final ab = objectbox.box<User>().getAll();

    // final alluser = objectbox.box<User>().getAll();
    // alluser.forEach((element) {
    //   debugPrint("user ${element.name} ${element.email}");
    // });
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
