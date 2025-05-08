import 'package:bloc_poc/models/freezed/login_state.dart';
import 'package:bloc_poc/models/freezed/person.dart';
import 'package:bloc_poc/models/freezed/response_generic_type.dart';

void main() {
  // // ---------------- 1 ---------------- Immutable
  // // Freezed สร้างคลาสที่เป็น Immutable โดยอัตโนมัติ
  // // ป้องกันการแก้ไขค่าของคลาสโดยตรง ทำให้มั่นใจว่า Data จะไม่ถูกแก้ไขโดยไม่ได้ตั้งใจ
  // final person = Person(firstName: "John", lastName: "Doe", age: 30);
  // // Error: person.firstName = "Jane"; // จะไม่สามารถแก้ไขได้

  // // ---------------- 2 ---------------- CopyWith
  // final person2 = Person(firstName: "John", lastName: "Doe", age: 30);
  // final updatedPerson = person2.copyWith(age: 31);
  // // print(updatedPerson); // Output: Person(firstName: John, lastName: Doe, age: 31)

  // ---------------- 3 ---------------- Multiple States
  // final state = LoginState.loading();
  // state.when(
  //   initial: () => print('Initial State'),
  //   loading: () => print('Loading...'),
  //   success: (user) => print('Welcome, $user'),
  //   error: (message) => print('Error: $message'),
  // );
  // Can check example in CounterWidget

  // ---------------- 4 ---------------- Union Types
  // final personJson = {"firstName": "Jane", "lastName": "Smith", "age": 25};
  // final person = Person.fromJson(personJson);
  // print(person.toJson()); // Output: {firstName: Jane, lastName: Smith, age: 25}

  // ---------------- 5 ---------------- Deep Equality
  // final person1 = Person(firstName: "John", lastName: "Doe", age: 30);
  // final person2 = Person(firstName: "John", lastName: "Doe", age: 30);
  // print(person1 == person2); // Output: true (แม้จะเป็นคนละ instance)

  // ---------------- 6 ---------------- Custom Methods
  // final person = Person(firstName: "John", lastName: "Doe", age: 30);
  // print(person.fullName); // Output: John Doe

  // ---------------- 7 ---------------- Supports Generic Types
  // final successResponse = ApiResponse<int>.success(200);
  // final failureResponse = ApiResponse<String>.error("Network Error");
  // print(successResponse); // Success<int>(200)
  // print(failureResponse); // Failure<String>(Network error)
}
