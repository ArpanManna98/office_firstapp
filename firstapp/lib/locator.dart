import 'package:firstapp/objectbox.g.dart';
import 'package:firstapp/repository/login_repo.dart';
import 'package:firstapp/repository/register_repo.dart';
import 'package:firstapp/repository_impl/login_repo_impl.dart';
import 'package:firstapp/repository_impl/register_repo_impl.dart';
import 'package:get_it/get_it.dart';

final dependency = GetIt.instance;

Future<void> setupLocator() async {
  var obInstance = await openStore();
  dependency.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(obInstance));
  dependency.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(obInstance));
}
