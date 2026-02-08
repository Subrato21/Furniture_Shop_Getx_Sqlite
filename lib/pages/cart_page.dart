import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shop/components/cart_checkout_button.dart';
import 'package:furniture_shop/components/cart_tile.dart';
import 'package:furniture_shop/model/model.dart';
import 'package:furniture_shop/theme/colors.dart';
import 'package:get/get.dart';
import 'package:furniture_shop/controller/product_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final ProductController controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Cart",
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leadingWidth: 80.r,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Image.asset(
                "assets/images/back.png",
                color: Colors.black,
                width: 24.w,
                height: 24.h,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SizedBox(
              height: 50.h,
              width: 50.w,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    // Clear all products from the cart
                    controller.clearCart();
                  },
                  icon: Image.asset(
                    "assets/images/trash.png",
                    height: 20.h,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Column(
          children: [
            // customers cart
            Expanded(
              child: Obx(
                () {
                  return controller.cart.isEmpty
                      ? Center(
                          child: Text(
                            "Your cart is empty!",
                            style: GoogleFonts.inter(
                                color: thirdColor, fontSize: 16.sp),
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.cart.length,
                          itemBuilder: (context, index) {
                            // get product from cart
                            final Product product = controller.cart[index];

                            //return to list tile
                            return CartTile(
                              product: product,
                              onTap: () {
                                //remove product from cart
                                controller.removeFromCart(product);
                              },
                            );
                          },
                        );
                },
              ),
            ),

            // Checkout button and total price
            Padding(
                padding: EdgeInsets.all(25.0.r),
                child: Obx(
                  () => CartCheckoutButton(
                    text: "Proceed to Checkout",
                    totalprice:
                        " | \$${controller.totalCartPrice.toStringAsFixed(0)}",
                    onTap: () {},
                  ),
                )),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
