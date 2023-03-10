import 'package:e_commerce_product_app/Model/product.dart';
import 'package:e_commerce_product_app/Screens/productDetailsPage.dart';
import 'package:e_commerce_product_app/config/colors.dart';
import 'package:flutter/material.dart';

class cartPage extends StatefulWidget {
  const cartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  void initState() {
    super.initState();

    cartItem = cartItem.toSet().toList();
  }

  late int totalAmount;

  @override
  Widget build(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("Ok"),
      onPressed: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => myOrder()));

        Navigator.of(context).pop();
      },
    );

    

    AlertDialog alert = AlertDialog(
      // context: context,
      title: Text("Removed"),
      content: Text("Removed from Cart Successfully"),
      actions: [
        okButton,
      ],
    );

    AlertDialog alertBuy = AlertDialog(
      // context: context,
      title: Text("Buyed Sucessfully"),
      content: Text("Order will be delivered to you within 3-4 days"),
      actions: [
        okButton,
      ],
    );
    totalAmount = 0;
    cartItem.forEach((element) {
      totalAmount += element.productPrize * element.selectedItem;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Cart"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          ...cartItem
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
                          color: darkPrimaryColor.withOpacity(0.5),
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
                                                primaryColor)),
                                    onPressed: () {
                                      setState(() {
                                        orderItem.add(e);
                                      });
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {

                                          return alertBuy; 
                                         
                                        },
                                      );
                                    },
                                    child: Text("Buy"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        cartItem.remove(e);
                                      });
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert; 
                                          
                                        },
                                      );
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                contrastColor)),
                                    child: Text(
                                      "Remove To Cart",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ))
              .toList(),
          Divider(
            thickness: 2,
          ),
          Text(
            "Total Product - ${cartItem.length}\n",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: contrastColor),
          ),
          Text(
            "Total Amount - $totalAmount",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: contrastColor),
          ),
          Divider(
            thickness: 2,
          )
        ]),
      ),
    );
  }
}
