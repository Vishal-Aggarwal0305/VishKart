import 'package:e_commerce_product_app/Model/product.dart';
import 'package:e_commerce_product_app/Screens/productDetailsPage.dart';
import 'package:e_commerce_product_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class notificationPage extends StatefulWidget {
  const notificationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<notificationPage> createState() => _mynotificationPage();
}

class _mynotificationPage extends State<notificationPage> {
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
          title: Text("Notifications"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text(
              "No New Notifications Right Now",
              style: GoogleFonts.mukta(fontSize: 13, color: Colors.grey),
            ),
          ),
        ));
  }
}
