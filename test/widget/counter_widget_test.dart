// test/counter_widget_test.dart
import 'package:bloc_poc/pages/counter_widget_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments when button is pressed', (
    WidgetTester tester,
  ) async {
    // // 1. Build widget
    await tester.pumpWidget(const MaterialApp(home: CounterWidget()));

    // // 2. หา Text widget และตรวจสอบค่าเริ่มต้น
    expect(find.text('Count: 0'), findsOneWidget);

    // // 3. กดปุ่ม increment
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pump(); // รอให้ UI update

    // // 4. ตรวจสอบว่า count เพิ่มขึ้น
    expect(find.text('Count: 1'), findsOneWidget);

    // expect(find.text('Login'), findsOneWidget); // ต้องมีปุ่ม "Login" 1 ปุ่มพอดี
    // expect(
    //   find.text('Error'),
    //   findsNothing,
    // ); // ไม่มีข้อความ "Error" อยู่ในหน้าจอเลย
    // expect(
    //   find.byType(Icon),
    //   findsWidgets,
    // ); // มี icon มากกว่า 1 อัน หรือหลายอันก็ได้
    // expect(
    //   find.byType(TextField),
    //   findsNWidgets(2),
    // ); // ต้องมี TextField 2 ช่อง เช่น username กับ password
  });
}
