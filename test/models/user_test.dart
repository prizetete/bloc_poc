// test/models/user_test.dart
import 'package:bloc_poc/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('User.fromJson ต้องแปลง JSON ได้ถูกต้อง', () {
    final json = {
      'id': 1,
      'name': 'Alice',
      'email': 'pai_upperclass@hotmail.com',
    };
    final user = User.fromJson(json);
    expect(user.id, 1);
    expect(user.name, 'Alice');
    expect(user.email, 'pai_upperclass@hotmail.com');
  });
}
