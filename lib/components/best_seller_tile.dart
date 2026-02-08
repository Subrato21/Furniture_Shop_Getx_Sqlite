import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shop/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_shop/model/model.dart';

class BestSellerTile extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const BestSellerTile({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20.r),
        ),
        margin: EdgeInsets.only(left: 25.w),
        padding: EdgeInsets.all(25.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    // Product Image
                    Image.asset(
                      product.imageUrl.first,
                      width: 80.w,
                      height: 75.h,
                    ),
                  ],
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  width: 160.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Name
                          Text(
                            product.name,
                            style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          //product type

                          Text(
                            product.type,
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: thirdColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // Price
                          Text(
                            '\$${product.price.toStringAsFixed(0)}',
                            style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
