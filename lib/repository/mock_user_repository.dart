import 'package:bloc_poc/models/user_model.dart';
import 'package:bloc_poc/repository/user_repository.dart';

class MockUserRepository extends UserRepository {
  @override
  Future<User> fetchUser() async {
    await Future.delayed(Duration(seconds: 1)); // จำลอง delay
    return const User(id: 99, name: 'Mock User', email: 'mock@example.com');
  }
}
