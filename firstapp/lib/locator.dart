import 'package:firstapp/objectbox.g.dart';
import 'package:firstapp/repository/login_repo.dart';
import 'package:firstapp/repository/preference_repo.dart';
import 'package:firstapp/repository/register_repo.dart';
import 'package:firstapp/repository_impl/login_repo_impl.dart';
import 'package:firstapp/repository_impl/preference_repo_impl.dart';
import 'package:firstapp/repository_impl/register_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dependency = GetIt.instance;

Future<void> setupLocator() async {
  var obInstance = await openStore();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  dependency.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(obInstance));
  dependency.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(obInstance));
  dependency.registerLazySingleton<PreferenceRepo>(() => PreferenceRepoImpl());
}
