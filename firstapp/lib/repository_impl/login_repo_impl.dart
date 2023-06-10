import 'package:firstapp/models/model.dart';
import 'package:firstapp/repository/login_repo.dart';
import 'package:firstapp/objectbox.g.dart' as ob;
import '../objectbox.g.dart';


class LoginRepoImpl extends LoginRepo {
  Store db;
  LoginRepoImpl(this.db);

  @override
  Future<Query<User>> login(String email, String pass) async {
    var data = db
        .box<User>()
        .query(ob.User_.email.equals(email) & ob.User_.password.equals(pass))
        .build();

    //var user = data.find().firstWhereOrNull((element) => element.email?.toLowerCase() == email.toLowerCase() && element.password?.toLowerCase() ==  pass.toLowerCase());
    return data;
  }
}
