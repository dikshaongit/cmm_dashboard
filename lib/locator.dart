import 'package:cmm_insight/data/stores/login_store.dart';
import 'package:cmm_insight/data/stores/poh_store.dart';
import 'package:cmm_insight/data/stores/token_store.dart';
import 'package:cmm_insight/data/stores/user_store.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => LoginStore());
  locator.registerLazySingleton(() => TokenStore());
  locator.registerLazySingleton(() => UserStore());
  locator.registerFactory(() => PohStore());
}
