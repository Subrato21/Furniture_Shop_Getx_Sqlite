import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_menu.dart';
import 'profile_picture.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePicture(),
        const SizedBox(height: 20),
        ProfileMenu(
          icon: "assets/icons/user.png",
          text: "My Account",
          onTap: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/bell.png",
          text: "Notifications",
          onTap: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/settings.png",
          text: "Settings",
          onTap: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/helps.png",
          text: "Help Center",
          onTap: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/logout.png",
          text: "Log Out",
          onTap: () => Get.toNamed('/intropage'),
        ),
      ],
    );
  }
}
