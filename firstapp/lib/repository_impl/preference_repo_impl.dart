import 'package:firstapp/main.dart';
import 'package:firstapp/repository/preference_repo.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepoImpl extends PreferenceRepo {
  Future<Stream<dynamic>> getUser(email) async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    globalSharedPrefs.setString("email", email);
    return email;
  }
}
