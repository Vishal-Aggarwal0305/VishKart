import 'package:e_commerce_product_app/Model/product.dart';
import 'package:e_commerce_product_app/Screens/productDetailsPage.dart';
import 'package:e_commerce_product_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class rewardsPage extends StatefulWidget {
  const rewardsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<rewardsPage> createState() => _myrewardsPage();
}

class _myrewardsPage extends State<rewardsPage> {
  @override
  void initState() {
    super.initState();

    cartItem = cartItem.toSet().toList();
  }

  late int totalAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("Rewards"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "All Empty here",
                  style: GoogleFonts.mukta(fontSize: 13, color: Colors.grey),
                ),
              ),
              Text(
                "Future rewards & coupons will be appeared here",
                style: GoogleFonts.mukta(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ));
  }
}
