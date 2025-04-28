import 'package:bloc_poc/repository/mock_user_repository.dart';
import 'package:bloc_poc/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator({bool useMock = false}) {
  if (useMock) {
    getIt.registerLazySingleton<UserRepository>(() => MockUserRepository());
  } else {
    getIt.registerLazySingleton<UserRepository>(() => UserRepository());
  }
}
