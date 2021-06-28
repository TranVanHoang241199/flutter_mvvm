import '../presentation.dart';
import 'package:get/get.dart';

class ShowNViewModel extends BaseViewModel {
  init() async {}
  goToSettingScreen() {
    Get.toNamed(Routers.setting);
    // notifyListeners();
  }

  goToSpeakScreen() {
    Get.toNamed(Routers.Speak);
    // notifyListeners();
  }

  goToHomeScreen() {
    Get.back();
  }

  goToContentScreen() {
    Get.toNamed(Routers.Content);
    // notifyListeners();
  }
}
