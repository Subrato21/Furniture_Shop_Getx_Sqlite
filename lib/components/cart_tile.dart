import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shop/controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:furniture_shop/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_shop/model/model.dart';

class CartTile extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  const CartTile({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    //Get the global ProductController instance for cart updates
    final productController = Get.find<ProductController>();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20.r),
        ),
        margin: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 25.h),
        padding: EdgeInsets.all(25.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: Product Image
            Image.asset(
              product.imageUrl.first,
              width: 80.w,
              height: 80.h,
            ),

            SizedBox(width: 24.w), // space between image and info

            // Right: Product info column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name,
                    style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),

                  // Product Type
                  Text(
                    product.type,
                    style:
                        GoogleFonts.inter(fontSize: 16.sp, color: thirdColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        '\$${product.price.toStringAsFixed(0)}',
                        style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      // Quantity controls
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () async {
                              if (product.quantity > 1) {
                                product.quantity--;
                                await productController.updateCartQuantity(
                                  product.id,
                                  product.quantity,
                                );
                                productController.refreshCart(); // refresh UI
                              }
                            },
                          ),
                          Text(
                            product.quantity.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () async {
                              product.quantity++;
                              await productController.updateCartQuantity(
                                product.id,
                                product.quantity,
                              );
                              productController.refreshCart(); // refresh UI
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: IconButton(
                          onPressed: () {
                            productController.removeFromCart(product);
                          },
                          icon: Image.asset(
                            "assets/images/trash.png",
                            height: 20.h,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
