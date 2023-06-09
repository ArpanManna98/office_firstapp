import 'package:firstapp/models/model.dart';
import 'package:firstapp/repository/register_repo.dart';
import 'package:objectbox/objectbox.dart';

class RegisterRepoImpl extends RegisterRepo {
  Store dbs;
  RegisterRepoImpl(this.dbs);

  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  @override
  Future<User> signup(String name, String email, String password) async {
    User user = await User(
        name: name, email: email, password: password, uid: idGenerator());
    var data = dbs.box<User>().put(user);
    return data;
  }
}
