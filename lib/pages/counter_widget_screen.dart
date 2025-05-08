import 'package:bloc_poc/models/freezed/login_state.dart';
import 'package:bloc_poc/models/freezed/response_generic_type.dart' as response;
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0; // เปลี่ยนชื่อเป็น _count เพื่อให้สื่อถึงว่าเป็นตัวแปรภายใน
  LoginState state = LoginState.loading();

  Future<void> _increment() async {
    response.ApiResponse response1 = response.ApiResponse<int>.success(200);
    // response.ApiResponse response2 = response.ApiResponse<String>.error(
    // "Network Error",
    // );

    setState(() {
      _count++;
      if (_count == 10) {
        state = LoginState.error('Number: $_count'); // เปลี่ยนสถานะเป็น Error
        response1 = response.ApiResponse<int>.error('Error: $_count');
      } else if (_count % 5 == 0) {
        state = LoginState.success('$_count');
        response1 = response.ApiResponse<int>.success(200);
      } else {
        state = LoginState.loading(); // เปลี่ยนสถานะเป็น Loading
        response1 = response.ApiResponse<int>.error('Loading: $_count');
      }

      handleApiResponse(response1);
    });
  }

  void handleApiResponse<T>(response.ApiResponse<T> response) {
    response.when(
      success: (data) {
        print("✅ Success: $data");
      },
      error: (message) {
        print("❌ Error: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Widget')),
      body: Center(
        // ใช้ Center เพื่อจัดตำแหน่งให้อยู่กลาง
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กลาง
          children: [
            if (state is Loading) // ตรวจสอบสถานะ
              const CircularProgressIndicator(), // แสดง Loading Indicator
            if (state is Success) // ตรวจสอบสถานะ
              Text(
                'Welcome ${(state as Success).user}', // แสดงข้อความต้อนรับ
                style: const TextStyle(fontSize: 24), // เพิ่มขนาดฟอนต์
              ),
            if (state is Error) // ตรวจสอบสถานะ
              Text(
                'Error ${(state as Error).message}', // แสดงข้อความแสดงข้อผิดพลาด
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                ), // เพิ่มขนาดฟอนต์และเปลี่ยนสีเป็นแดง
              ),
            const SizedBox(height: 16), // เพิ่มช่องว่างระหว่าง Text และ Counter
            Text(
              'Count: $_count',
              style: const TextStyle(fontSize: 24), // เพิ่มขนาดฟอนต์
            ),
            const SizedBox(height: 16), // เพิ่มช่องว่างระหว่าง Text และ Button
            ElevatedButton(
              key: const Key('incrementButton'),
              onPressed: _increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
