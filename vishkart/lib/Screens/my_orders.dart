import 'package:e_commerce_product_app/Model/product.dart';
import 'package:e_commerce_product_app/Screens/productDetailsPage.dart';
import 'package:e_commerce_product_app/config/colors.dart';
import 'package:flutter/material.dart';

// Widget cancelButton = ElevatedButton(
//   child: Text("Cancel"),
//   onPressed: () {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => SignUpScreen()));
//   },
// );
// Widget continueButton = ElevatedButton(
//   child: Text("Continue"),
//   onPressed: () {
//     // orderItem.remove();
//   },
// );

// // set up the AlertDialog
// AlertDialog alert = AlertDialog(
//   title: Text("AlertDialog"),
//   content:
//       Text("Would you like to continue learning how to use Flutter alerts?"),
//   actions: [
//     cancelButton,
//     continueButton,
//   ],
// );
// show the dialog

class myOrder extends StatefulWidget {
  const myOrder({
    Key? key,
  }) : super(key: key);

  @override
  State<myOrder> createState() => _myOrderState();
}

class _myOrderState extends State<myOrder> {
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

    // Widget continueButton = TextButton(
    //   child: Text("Continue"),
    //   onPressed: () {
    //      Navigator.of(context).pop();
    //     }

    //     // Navigator.pop(context, continue outerloop);
    //     // continue outerloop;
    //     // orderItem.remove(e);
    //   },

// set up the AlertDialog

    AlertDialog alert = AlertDialog(
      // context: context,
      title: Text("Returned Successfully"),
      content:
          Text("Refund will be processed in your bank account within 2-3 days"),
      actions: [
        okButton,
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("My Orders"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: orderItem
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
                                      fit: BoxFit.fitHeight,
                                    ),
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

                                  // Text(
                                  //   "Qty:${e.selectedItem * e.productPrize}",
                                  //   style: TextStyle(
                                  //       fontSize: 20,
                                  //       fontWeight: FontWeight.w500),
                                  // ),

                                  Text("${e.productPrize} RS",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      )
                                      // fontWeight: FontWeight.bold),
                                      ),

                                  SizedBox(
                                    height: 5,
                                  ),

                                  Text(
                                    "Qty:${e.selectedItem}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
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
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                contrastColor2)),
                                    onPressed: () {
                                      setState(() {
                                        orderItem.remove(e);
                                      });
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          

                                          return alert; //correct
                                          
                                        },
                                      );
                                      //  setState(() {
                                      //   orderItem.remove(e);
                                      // });

                                      // orderItem.remove(e);
                                    },
                                    child: Text("Return Product"),
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
