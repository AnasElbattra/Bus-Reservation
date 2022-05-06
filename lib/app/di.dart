import 'package:get_it/get_it.dart';
import 'package:gobusss/app/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initApp() async {
  final _sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => _sharedPreferences);
  getIt.registerLazySingleton<AppPreferences>(
      () => AppPreferences(getIt<SharedPreferences>()));
}
