import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Favorite",
          style: GoogleFonts.inter(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Align(
          //   alignment: Alignment.center,
          //   child: Text(
          //     "Opps nothing is here...",
          //     style: GoogleFonts.inter(
          //       color: thirdColor,
          //       fontSize: 16,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 12),
            child: Text(
              "My Wishlist",
              style: GoogleFonts.inter(
                color: Color(0xFF828282),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(left: 25),
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          // Product Image
                          Image.asset(
                            "assets/images/rockingchair 2.png",
                            width: 80,
                            height: 80,
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product Name
                                Text(
                                  " Rocking Chair",
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                //product type

                                Text(
                                  "Armchair",
                                  style: GoogleFonts.inter(
                                      fontSize: 14, color: thirdColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Price
                                Text(
                                  '\$258',
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
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
                      SizedBox(width: 24),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/icons/love.png",
                          height: 24,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(left: 25),
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          // Product Image
                          Image.asset(
                            "assets/images/Table Lamp.png",
                            width: 80,
                            height: 80,
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product Name
                                Text(
                                  " Vintage Table Lamp",
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                //product type

                                Text(
                                  "Decoration",
                                  style: GoogleFonts.inter(
                                      fontSize: 14, color: thirdColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Price
                                Text(
                                  '\$230',
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
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
                      SizedBox(width: 24),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/icons/love.png",
                          height: 24,
                        ),
                      )
                    ],
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
