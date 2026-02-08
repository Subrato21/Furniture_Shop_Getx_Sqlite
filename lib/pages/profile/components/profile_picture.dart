import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: 110.w,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: Image.asset(
              "assets/icons/boy.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: -12,
            child: SizedBox(
              height: 46.h,
              width: 46.w,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(8.r),
                  backgroundColor: const Color(0xFFF5F6F9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
                onPressed: () {},
                child: Image.asset("assets/icons/camera.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
