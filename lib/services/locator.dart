
import 'package:get_it/get_it.dart';
import 'auth_service.dart';
import 'navigation_service.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthService());
}