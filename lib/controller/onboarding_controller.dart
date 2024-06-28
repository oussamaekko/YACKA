import 'package:get/get_state_manager/get_state_manager.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChaned(int index);
}

class OnBoardingControllerImpl extends OnBoardingController {
  @override
  next() {}

  @override
  onPageChaned(int index) {}

  @override
  void onClose() {
    // TODO: implement onClose
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
