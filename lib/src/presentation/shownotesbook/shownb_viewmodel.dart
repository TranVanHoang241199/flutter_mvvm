import '../presentation.dart';
import 'package:get/get.dart';

class ShowNBViewModel extends BaseViewModel {
  List<int> selectedItems = [];
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

  void selectItem(int index) {
    int checkExist = -1;
    checkExist = selectedItems.indexOf(index);
    if (checkExist != -1) {
      selectedItems.add(index);
    }
  }
}
