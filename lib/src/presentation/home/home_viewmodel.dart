import '../presentation.dart';
import 'package:get/get.dart';

class HomeViewModel extends BaseViewModel {
  init() async {}

  goToSettingScreen() {
    Get.toNamed(Routers.setting);
    // notifyListeners();
  }

  goToShowNdScreen() {
    Get.toNamed(Routers.ShowNd);
    // notifyListeners();
  }

  goToShowNScreen() {
    Get.toNamed(Routers.ShowN);
    // notifyListeners();
  }

  goToSpeakScreen() {
    Get.toNamed(Routers.Speak);
    // notifyListeners();
  }

  goToContentScreen() {
    Get.toNamed(Routers.Content);
    // notifyListeners();
  }
}
