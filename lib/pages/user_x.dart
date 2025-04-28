import 'package:bloc_poc/models/user_model.dart';
import 'package:bloc_poc/repository/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository repository;

  UserController(this.repository);

  var user = Rxn<User>(); // เก็บข้อมูลผู้ใช้
  var isLoading = false.obs; // สำหรับแสดง loading

  void loadUser() async {
    isLoading.value = true;
    try {
      user.value = await repository.fetchUser();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
