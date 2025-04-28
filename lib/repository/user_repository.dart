import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/user_model.dart';

@injectable
class UserRepository {
  final Dio dio = Dio();

  Future<User> fetchUser() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users/1',
    );

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch user');
    }
  }
}
