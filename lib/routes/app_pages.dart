import 'package:get/get.dart';

// import 'package:navigation_drawer_flutter_getx/app/modules/home/bindings/home_binding.dart';

import 'package:yacka_mobile/view/screens/auth/login_screen.dart';
import 'package:yacka_mobile/view/screens/home_screen.dart';
import 'package:yacka_mobile/view/screens/product_detail_screen.dart';
import 'package:yacka_mobile/view/screens/profile_screen.dart';
import 'package:yacka_mobile/view/screens/rewards_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CONNCTER,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => Profile(),
    ),
    GetPage(
      name: _Paths.CADEUX,
      page: () => RewardPage(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => ProductDetailPage(),
    ),
  ];
}
