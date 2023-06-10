import 'package:firstapp/models/model.dart';
// import '../objectbox.g.dart';

abstract class RegisterRepo {
  Future<User> signup(String name, String email, String password);
}
