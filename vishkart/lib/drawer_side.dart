import 'package:e_commerce_product_app/Model/product.dart';
import 'package:e_commerce_product_app/Screens/bookmarkedItemPage.dart';
import 'package:e_commerce_product_app/Screens/cartPage.dart';
import 'package:e_commerce_product_app/Screens/my_orders.dart';
import 'package:e_commerce_product_app/Screens/nottificationPage.dart';
import 'package:e_commerce_product_app/Screens/rewardsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce_product_app/Screens/signin_screen.dart';
import 'package:e_commerce_product_app/Screens/signup_screen.dart';
import 'package:e_commerce_product_app/Screens/splash_screen.dart';
import 'package:e_commerce_product_app/config/colors.dart';
import 'package:e_commerce_product_app/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/productDetailsPage.dart';
import 'Screens/seeAllProductpage.dart';
import 'main.dart';

class DrawerSide extends StatefulWidget {
  //  UserProvider userProvider;
  // DrawerSide({required this.userProvider});
  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  //  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initial();
  // }

  // void initial() async {
  //   logindata = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = logindata.toString();
  //   });
  // }

  final email = FirebaseAuth.instance.currentUser!.email;
  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      print('Verification Email has been sent');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Verification Email has been sent',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );
    } else {
      print("Email is verified");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromARGB(255, 86, 154, 87),
          content: Text(
            'Email Verified',
            style: TextStyle(
                fontSize: 14.0, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      );
    }
  }
  // final username = FirebaseAuth.instance.currentUser!.username;

  Widget listTile({required IconData icon, required String title}) {
    return ListTile(
        leading: Icon(
          icon,
          size: 32,
        ),
        title: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 16,
            color: Colors.black54,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //  var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: lightPrimaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              // accountName: Text("Vishal"),
              // accountEmail: Text("vishal@gmail.com"),
              // currentAccountPicture: Image.network(
              //     "https://png.pngtree.com/element_our/png/20180918/chef-cooking-fried-chicken-and-delicious-sign-png_103460.jpg"),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://i.ibb.co/K9cH8mw/Vish-Kart-White2.png'),
                      // backgroundImage: NetworkImage(
                      //    userData.userImage ??
                      //    'https://png.pngtree.com/element_our/png/20180918/chef-cooking-fried-chicken-and-delicious-sign-png_103460.jpg'),
                      // backgroundImage: const AssetImage('VishKartWhite.png'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome",
                        style: GoogleFonts.rowdies(
                            fontSize: 16, color: Color(0x77000103)),
                      ),
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          "$email",
                          style: GoogleFonts.poppins(
                              fontSize: 7,
                              color: Color.fromARGB(231, 255, 255, 255)),
                        ),
                      ),
                      // Text(
                      //  userData.userName,
                      //   style: GoogleFonts.rowdies(
                      //       fontSize: 15, color: Color(0x77000103)),
                      // ),
                      SizedBox(
                        height: 7,
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      user != null && !user!.emailVerified
                          ? OutlinedButton(
                              style: TextButton.styleFrom(
                                foregroundColor: textColor,
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 123, 208, 155),
                                    width: 2), // Text Color
                              ),
                              onPressed: () async {
                                // setState(() {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => DrawerSide()),
                                //   );
                                //   // updating the state
                                // });
                                await user!.sendEmailVerification();
                                print('Verification Email has been sent');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 86, 154, 87),
                                    content: Text(
                                      'Verification Email has been sent',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Verify Email",
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          : Text(
                              "Verified ✔️",
                              style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  color: Color.fromARGB(136, 64, 255, 43),
                                  fontWeight: FontWeight.w600),
                            ),
                    ],
                  )
                ],
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => seeAllProductpage(
                        item: {'category': 'Mobile', 'product': mobileList}),
                  ),
                );
              },
              leading: Icon(Icons.smartphone_outlined),
              title: Text(
                "Mobiles",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            // listTile(icon: Icons.smartphone_outlined, title: "Mobiles"),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => seeAllProductpage(
                        item: {'category': 'Watches', 'product': WatcheList}),
                  ),
                );
              },
              leading: Icon(Icons.watch_outlined),
              title: Text(
                "Watches",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => seeAllProductpage(
                        item: {'category': 'Smart TV', 'product': smartLED}),
                  ),
                );
              },
              leading: Icon(Icons.tv_outlined),
              title: Text(
                "Smart TV",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            // listTile(icon: Icons.tv_outlined, title: "Smart TV"),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => seeAllProductpage(item: {
                      'category': 'Wireless Earbuds',
                      'product': wirelessEarbudsList
                    }),
                  ),
                );
              },
              leading: Icon(Icons.headset),
              title: Text(
                "Earbuds",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => seeAllProductpage(
                        item: {'category': 'Refrigerator', 'product': fridge}),
                  ),
                );
              },
              leading: Icon(Icons.kitchen_outlined),
              title: Text(
                "Refrigerator",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => seeAllProductpage(
                        item: {'category': 'Utilities', 'product': utility}),
                  ),
                );
              },
              leading: Icon(Icons.plumbing_outlined),
              title: Text(
                "Utilities",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),
            // listTile(icon: Icons.headset, title: "Earbuds"),

            Column(
              children: const [
                (Divider(
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromARGB(57, 86, 213, 118),
                )),
              ],
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => myOrder(),
                  ),
                );
              },
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text(
                "My Orders",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => cartPage(),
                  ),
                );
              },
              leading: Icon(Icons.shopping_cart_checkout),
              title: Text(
                "My Cart",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookmarkedItemPage(),
                  ),
                );
              },
              leading: Icon(Icons.favorite_outline),
              title: Text(
                "My Wishlist",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            Column(
              children: const [
                (Divider(
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromARGB(57, 86, 213, 118),
                )),
              ],
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => rewardsPage(),
                  ),
                );
              },
              leading: Icon(Icons.wallet_giftcard),
              title: Text(
                "My Rewards",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => notificationPage(),
                  ),
                );
              },
              leading: Icon(Icons.notifications),
              title: Text(
                "Notifications",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            // listTile(icon: Icons.notifications, title: "Notifications"),

            Column(
              children: const [
                (Divider(
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromARGB(57, 86, 213, 118),
                )),
              ],
            ),

            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                );
              },
              leading: Icon(Icons.logout_outlined),
              title: Text(
                "Logout",
                style: GoogleFonts.openSans(
                    color: textColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
            ),

            // listTile(icon: Icons.favorite_outline, title: "Wishlist"),
            // listTile(icon: Icons.content_paste_go, title: "Raise a Complaint"),
            // listTile(icon: Icons.format_quote_outlined, title: "FAQs"),
            // Container(
            //   height: 600,
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       // mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         Text(
            //           "Contact Support",
            //           style: GoogleFonts.robotoSlab(
            //             color: Color(0x8E000000),
            //           ),
            //         ),
            //         SizedBox(
            //           height: 10,
            //         ),
            //         Row(
            //           children: [
            //             Text(
            //               "Call us:",
            //               style: GoogleFonts.robotoSlab(
            //                 color: Color(0x5A000000),
            //               ),
            //             ),
            //             SizedBox(
            //               width: 10,
            //             ),
            //             Text(
            //               "+919306203046",
            //               style: GoogleFonts.robotoSlab(
            //                 color: Color(0x5A000000),
            //               ),
            //             )
            //           ],
            //         ),
            //         SizedBox(
            //           height: 5,
            //         ),
            //         Row(
            //           children: [
            //             Text(
            //               "Mail us:",
            //               style: GoogleFonts.robotoSlab(
            //                   color: Color(0x5A000000), fontSize: 12),
            //             ),
            //             SizedBox(
            //               width: 10,
            //             ),
            //             Text(
            //               "aggarwalvishal0305@gmail.com",
            //               style: GoogleFonts.robotoSlab(
            //                   color: Color(0x5A000000), fontSize: 11),
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
