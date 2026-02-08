import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shop/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_shop/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // extends to the top as we used an image in a column
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // icon
          AspectRatio(
            aspectRatio: 0.75,
            child: Image.asset(
              'assets/images/chair1.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Wrap Expanded outside Padding to fix ParentDataWidget error
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(25.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    'Enjoy Your Online Shopping',
                    style: GoogleFonts.inter(
                      fontSize: 36.sp,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // subtitile
                  Text(
                    'Browse through all categories and shop the best furniture for your dream house',
                    style: TextStyle(color: secondaryColor, fontSize: 18.sp),
                  ),

                  //const SizedBox(height: 25),
                  //get started button
                  MyButton(
                    text: 'Get Started',
                    onTap: () {
                      // go to the menu page
                      Navigator.pushNamed(context, '/homepage');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
