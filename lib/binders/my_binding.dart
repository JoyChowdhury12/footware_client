import 'package:footware_client/controller/home_controller.dart';
import 'package:footware_client/controller/login_controller.dart';
import 'package:get/get.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(HomeController());
  }
}
