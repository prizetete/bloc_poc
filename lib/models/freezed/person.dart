// lib/models/person.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    required int age,
    // @Default(18) int age, // ค่าเริ่มต้นคือ 18 ถ้าไม่ระบุค่า age
  }) = _Person;
  const Person._(); // ใช้เพื่อสร้าง Custom Method
  String get fullName => '$firstName $lastName';

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
