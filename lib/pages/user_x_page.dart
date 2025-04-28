import 'package:bloc_poc/pages/user_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserXPage extends StatelessWidget {
  UserXPage({super.key});
  final controller = Get.put(UserController(Get.find())); // Inject controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Info')),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          } else if (controller.user.value != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${controller.user.value!.name}'),
                Text('Email: ${controller.user.value!.email}'),
              ],
            );
          } else {
            return ElevatedButton(
              onPressed: controller.loadUser,
              child: Text('Fetch User'),
            );
          }
        }),
      ),
    );
  }
}
