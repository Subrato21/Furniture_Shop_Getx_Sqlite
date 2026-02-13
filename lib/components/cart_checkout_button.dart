import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shop/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCheckoutButton extends StatelessWidget {
  final String text;
  final String totalprice;
  final void Function()? onTap;
  const CartCheckoutButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            Text(
              text,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              totalprice,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
