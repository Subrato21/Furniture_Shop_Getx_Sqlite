import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/colors.dart';
import 'profile_menu.dart';
import 'profile_picture.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePicture(),
        const SizedBox(height: 12),
        Text(
          "Smith Williams",
          style: GoogleFonts.inter(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            width: double.infinity,
            color: const Color(0xFFF5F6F9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 25),
                  child: Text(
                    "Accounts",
                    style: GoogleFonts.inter(
                      color: Color(0xFF828282),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ProfileMenu(
                  icon: "assets/icons/settings.png",
                  text: "Settings",
                  onTap: () {},
                ),
                ProfileMenu(
                  icon: "assets/icons/bell.png",
                  text: "Notifications",
                  onTap: () {},
                ),
                ProfileMenu(
                  icon: "assets/icons/clock.png",
                  text: "Order History",
                  color: null,
                  onTap: () {},
                ),
                ProfileMenu(
                  icon: "assets/icons/t&c.png",
                  text: "Terms & Conditions",
                  onTap: () {},
                ),
                ProfileMenu(
                  icon: "assets/icons/logout.png",
                  text: "Log Out",
                  onTap: () => Get.toNamed('/intropage'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
