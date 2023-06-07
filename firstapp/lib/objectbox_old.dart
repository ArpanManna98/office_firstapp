import 'package:firstapp/objectbox.g.dart';
import 'package:firstapp/models/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ObjectBox {
  late final Store store;
  late final Box<User> userBox;
  ObjectBox._create(this.store) {
    userBox = Box<User>(store);
  }

   static Future<ObjectBox> create() async {
    final store = await openStore(
        directory: p.join(
            (await getApplicationDocumentsDirectory()).path, "obx-demo"));
    return ObjectBox._create(store);
  }
}
