import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shop/theme/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(40.r),
          ),
          padding: EdgeInsets.all(20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text of the button
              Text(text, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
