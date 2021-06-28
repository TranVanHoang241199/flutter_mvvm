import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class SplashViewModel extends BaseViewModel {
  init() async {}

  goToHomeScreen() {
    Get.offAndToNamed(Routers.home);
  }
}
