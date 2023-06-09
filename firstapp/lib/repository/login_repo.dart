import 'package:firstapp/models/model.dart';

import '../objectbox.g.dart';

abstract class LoginRepo {
  Future<Query<User>> login(String email, String pass);
}
