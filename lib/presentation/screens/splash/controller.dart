import 'package:get/get.dart';

import '../../../app/routes/routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  ///   [loadData] method is used to load initial data
  Future<void> loadData() async {
    Future.delayed(const Duration(seconds: 3), () => navigateToScreen());
  }

  ///   [navigateToScreen] method is used to redirect users to other screen as
  ///   soon as initial data is loaded successfully
  void navigateToScreen() {
    Get.offAllNamed(Routes.dashboard);
  }
}