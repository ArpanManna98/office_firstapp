import 'package:objectbox/objectbox.dart';
import 'package:firstapp/objectbox.g.dart';

@Entity()
class User {
  @Id()
  int id = 0;
  String uid;
  String? name;
  String? email;
  String? password;
  User({required this.name, required this.email, required this.password, required this.uid});

}
