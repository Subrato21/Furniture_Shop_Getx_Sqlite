import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shop/theme/colors.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.color = primaryColor,
  });

  final String text, icon;
  final Color? color;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(20.r),
            backgroundColor: const Color(0xFFF5F6F9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            )),
        onPressed: onTap,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 22.w,
              color: color,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
