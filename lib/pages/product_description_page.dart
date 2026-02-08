import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shop/components/description_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_shop/controller/product_description_controller.dart';
import 'package:furniture_shop/model/model.dart';
import 'package:furniture_shop/theme/colors.dart';

class ProductDescriptionPage extends StatelessWidget {
  final Product product;

  const ProductDescriptionPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final ProductDescriptionController controller =
        Get.put(ProductDescriptionController());

    // Reactive variable for Read More toggle
    final RxBool isExpanded = false.obs;

    return Scaffold(
      extendBodyBehindAppBar: true, // Allows content behind AppBar
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent, // Make AppBar transparent
        leadingWidth: 80.r,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SizedBox(
            width: 50.w, // desired width of your circular container
            height: 50.h, // desired height
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
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: SizedBox(
              width: 50.w, // desired width of your circular container
              height: 50.h, // desired height
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle, // makes it circular
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/favourite.png",
                      color: Colors.black, width: 24.w, height: 24.h),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack to put image behind AppBar
            Stack(
              children: [
                // Product image
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    product.imageUrl.first,
                    width: double.infinity,
                    height: 360.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.h),

            Container(
              padding: EdgeInsets.symmetric(vertical: 50.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.3), // shadow color
                    spreadRadius: 10.r, // how much the shadow spreads
                    blurRadius: 40.r, // blur effect
                    offset: Offset(0, 5), // horizontal & vertical offset
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Product name, type, rating
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side — product info
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 240.w,
                              child: Text(
                                product.name,
                                style: GoogleFonts.inter(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                softWrap:
                                    true, // allows text to wrap to next line
                                maxLines: 2, // limit to 2 lines
                                overflow: TextOverflow
                                    .ellipsis, // shows "..." if text is longer than 2 lines
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              product.type,
                              style: GoogleFonts.inter(
                                color: thirdColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        // Right side — rating
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade100,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16.r),
                              SizedBox(width: 4.w),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0.w, vertical: 2.h),
                                child: Text(
                                  product.rating.toString(),
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.h),

                  // Product description with Read More
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.h),
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.description,
                            style: GoogleFonts.inter(
                              color: thirdColor,
                              fontSize: 16.sp,
                            ),
                            maxLines: isExpanded.value
                                ? null
                                : 2, // isExpanded False initially so it will make it 2 line  if True do nothing.
                            overflow: isExpanded.value
                                ? TextOverflow.visible
                                : TextOverflow
                                    .ellipsis, // add ... dot after making 2 lines
                          ),
                          SizedBox(height: 5.h),
                          GestureDetector(
                            onTap: () => isExpanded.value = !isExpanded
                                .value, // initially isExpanded is false but after tapping it makes it to True,
                            child: Text(
                              isExpanded.value ? "Read Less" : "Read More",
                              style: GoogleFonts.inter(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: Row(
                      children: [
                        ...List.generate(
                            product.imageUrl.length,
                            (index) => Padding(
                                  padding: EdgeInsets.only(
                                      top: 24.h, left: 4.w, bottom: 24.h),
                                  child: InkWell(
                                    child: Container(
                                      height: 53.h,
                                      width: 50.r,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: secondaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: Image.asset(
                                        product.imageUrl[index],
                                      ),
                                    ),
                                  ),
                                )),
                      ],
                    ),
                  ),

                  // Color selector + Quantity
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Colors
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Color",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Obx(() => Row(
                                  children: List.generate(
                                    controller.colorOptions.length,
                                    (index) => GestureDetector(
                                      onTap: () =>
                                          controller.changeColor(index),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 4.0.w),
                                        height: 24.h,
                                        width: 24.w,
                                        decoration: BoxDecoration(
                                          color: controller.colorOptions[index],
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: controller.selectedColorIndex
                                                        .value ==
                                                    index
                                                ? Colors.black
                                                : Colors.transparent,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),

                        // Quantity controls
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: controller.decrement,
                            ),
                            Obx(() => Text(
                                  controller.quantity.value.toString(),
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: controller.increment,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // Add to cart button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: DescriptionButton(
                      text: 'Add to Cart ',
                      price: ' | ' '\$${product.price.toInt()}',
                      onTap: () {
                        controller.addToCart(product);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
