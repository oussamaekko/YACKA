import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yacka_mobile/routes/app_pages.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            buildDrawerHeader(),
            const Divider(color: Colors.grey),
            buildDrawerItem(
              icon: Icons.home,
              text: "Home",
              onTap: () => navigate(0),
              tileColor: Get.currentRoute == Routes.HOME ? Colors.blue : null,
              textIconColor:
                  Get.currentRoute == Routes.HOME ? Colors.white : Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.login_outlined,
              text: "Conncter",
              onTap: () => navigate(1),
              tileColor:
                  Get.currentRoute == Routes.CONNCTER ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.CONNCTER
                  ? Colors.white
                  : Colors.black,
            ),
            buildDrawerItem(
                icon: Icons.card_giftcard_outlined,
                text: "Cadeaux",
                onTap: () => navigate(2),
                tileColor:
                    Get.currentRoute == Routes.CADEUX ? Colors.blue : null,
                textIconColor: Get.currentRoute == Routes.CADEUX
                    ? Colors.white
                    : Colors.black),
            buildDrawerItem(
                icon: Icons.details_outlined,
                text: "Detail",
                onTap: () => navigate(3),
                tileColor:
                    Get.currentRoute == Routes.DETAIL ? Colors.blue : null,
                textIconColor: Get.currentRoute == Routes.DETAIL
                    ? Colors.white
                    : Colors.black),
            buildDrawerItem(
                icon: Icons.verified_user_outlined,
                text: "Profile",
                onTap: () => navigate(4),
                tileColor:
                    Get.currentRoute == Routes.PROFILE ? Colors.blue : null,
                textIconColor: Get.currentRoute == Routes.PROFILE
                    ? Colors.white
                    : Colors.black),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerHeader() {
    return const UserAccountsDrawerHeader(
      accountName: Text("Imane ch"),
      accountEmail: Text("imane.ch@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/images/erza.jpg'),
      ),
      currentAccountPictureSize: Size.square(72),
      otherAccountsPictures: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text("IC"),
        )
      ],
      otherAccountsPicturesSize: Size.square(50),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed(Routes.HOME);
    } else if (index == 1) {
      Get.toNamed(Routes.CONNCTER);
    }
    if (index == 2) {
      Get.toNamed(Routes.CADEUX);
    }
    if (index == 3) {
      Get.toNamed(Routes.DETAIL);
    }
    if (index == 4) {
      Get.toNamed(Routes.PROFILE);
    }
  }
}
