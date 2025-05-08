import 'package:bloc_poc/models/user_model.dart';
import 'package:bloc_poc/repository/user_repository.dart';
import 'package:bloc_poc/services/tax_service.dart';
import 'package:bloc_poc/services/user_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_service_test.mocks.dart';

@GenerateMocks([UserService, UserRepository])
void main() {
  late MockUserService mockUserService;
  late MockUserRepository mockUserRepo;

  setUp(() {
    mockUserService = MockUserService();
    mockUserRepo = MockUserRepository();
  });

  group('mockito test', () {
    test('test user repo', () async {
      when(
        mockUserRepo.fetchUser(),
      ).thenAnswer((_) async => User(id: 1, name: 'name', email: 'email'));
      final result = await mockUserRepo.fetchUser();
      expect(result.id, 1);
      verify(mockUserRepo.fetchUser()).called(1);
    });

    test('test user service', () async {
      when(mockUserService.getUsername()).thenAnswer((_) async => 'MockUser');
      final result = await mockUserService.getUsername();
      expect(result, 'MockUser');
      verify(mockUserService.getUsername()).called(1);
    });
  });

  group('calculateTax', () {
    test('รายได้ 100,000 บาท อัตราภาษี 5% ต้องได้ 5,000', () {
      final result = calculateTax(100000, 5);
      expect(result, 5000);
    });

    test('รายได้ 0 บาท ต้องเสียภาษี 0', () {
      final result = calculateTax(0, 5);
      expect(result, 0);
    });

    test('รายได้ติดลบ ต้อง throw error', () {
      try {
        calculateTax(10000, -5);
        fail('ควรจะเกิด error แต่ไม่เกิด');
      } catch (e) {
        expect(e, isArgumentError);
      }
    });

    test('อัตราภาษีติดลบ ต้อง throw error', () {
      expect(() => calculateTax(10000, -5), throwsArgumentError);
    });
  });
}
