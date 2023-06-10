import 'package:firstapp/const/const.dart';
// import 'package:firstapp/main.dart';
import 'package:firstapp/repository/preference_repo.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepoImpl extends PreferenceRepo {
  SharedPreferences instance;

  PreferenceRepoImpl(this.instance);

  Future<bool> setEmail(String email) {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    return instance.setString("email", email);
  }

  @override
  String? email() {
    return instance.getString("email");
  }
}
