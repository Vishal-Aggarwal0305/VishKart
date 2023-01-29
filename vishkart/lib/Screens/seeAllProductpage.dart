import 'package:e_commerce_product_app/Model/product.dart';
import 'package:e_commerce_product_app/Screens/productDetailsPage.dart';
import 'package:e_commerce_product_app/config/colors.dart';
import 'package:flutter/material.dart';

class seeAllProductpage extends StatefulWidget {
  seeAllProductpage({Key? key, required this.item}) : super(key: key);

  Map item;

  @override
  State<seeAllProductpage> createState() => _seeAllProductpageState();
}

class _seeAllProductpageState extends State<seeAllProductpage> {
  @override
  Widget build(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      // context: context,
      title: Text("Done"),
      content: Text("Item Added to wishlist"),
      actions: [
        okButton,
      ],
    );

    AlertDialog alertcart = AlertDialog(
      // context: context,
      title: Text("Operation Done"),
      content: Text("Item added to Cart"),
      actions: [
        okButton,
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("${widget.item["category"]}"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: widget.item["product"]
              .map<Widget>((e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            product: e,
                          ),
                        ),
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: contrastColor2.withOpacity(0.5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),

                        // height: 300,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 200,
                                    width: 175,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    child: Image.network(
                                      e.productImage,
                                      width: 200,
                                      height: 200,
                                      // fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${e.productPrize} RS",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("${e.productName}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  25))),
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Container(
                                                    height: 300,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    25))),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: e
                                                            .productDescription
                                                            .map<Widget>(
                                                                (e) => ListTile(
                                                                      title: Text(
                                                                          "${e[0]}"),
                                                                      subtitle:
                                                                          Text(
                                                                              "${e[1]}"),
                                                                    ))
                                                            .toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ));
                                      },
                                      child: Text(
                                        "View Description",
                                        style: TextStyle(color: textColor),
                                      )),
                                  Text(
                                    "${e.selectedItem * e.productPrize}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (e.selectedItem > 1) {
                                              e.selectedItem -= 1;
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.remove,
                                            color: darkPrimaryColor),
                                      ),
                                      Text(
                                        "${e.selectedItem.toString()}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            e.selectedItem += 1;
                                          });
                                        },
                                        icon: Icon(Icons.add,
                                            color: darkPrimaryColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                contrastColor2)),
                                    onPressed: () {
                                      cartItem.add(e);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alertcart;
                                        },
                                      );
                                    },
                                    child: Text("Add To Cart"),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                contrastColor)),
                                    onPressed: () {
                                      bookmarkedItem.add(e);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );
                                    },
                                    child: Text("Add To Wishlist"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
