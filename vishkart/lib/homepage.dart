import 'package:e_commerce_product_app/Screens/bookmarkedItemPage.dart';
import 'package:e_commerce_product_app/Screens/cartPage.dart';
import 'package:e_commerce_product_app/config/colors.dart';
import 'package:e_commerce_product_app/drawer_side.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:e_commerce_product_app/providers/user_provider.dart';

import 'Model/product.dart';
import 'Screens/productDetailsPage.dart';
import 'Screens/seeAllProductpage.dart';
import 'Screens/splash_screen.dart';
// void main() => runApp(homeScreen());

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
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

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    // productProvider = Provider.of(context);
    // UserProvider userProvider = Provider.of(context);
    // userProvider.getUserData();
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        drawer: DrawerSide(),
        // drawer: DrawerSide(userProvider: userProvider),
        appBar: AppBar(
          title: Text("VishKart"),
          backgroundColor: primaryColor,
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookmarkedItemPage(),
                  ),
                );
              },
              icon: Icon(Icons.bookmark_add_outlined),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: darkPrimaryColor,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => cartPage(),
                ),
              );
            },
            child: Icon(
              Icons.shopping_cart,
            )),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: productList
                .map((e) => Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e['category'],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => seeAllProductpage(
                                            item: e,
                                          )));
                                },
                                child: Text("See All"),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: e['product']
                                .map<Widget>((item) => GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailsPage(
                                            product: item,
                                          ),
                                        ),
                                      );
                                    },
                                    child:
                                        verticalScrollProductView(item: item)))
                                .toList(),
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ));
  }
}

Widget verticalScrollProductView({required Product item}) {
  return Container(
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(5),

    decoration: BoxDecoration(
      color: lightPrimaryColor.withOpacity(0.5),
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),

    // height: 300,
    width: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 200,
          width: 200,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Image.network(
            item.productImage,
            width: 200,
            height: 200,
            // fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "${item.productPrize} RS",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text("${item.productName}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center),
        SizedBox(
          height: 5,
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(contrastColor2)),
          onPressed: () {
            cartItem.add(item);
          },
          child: Text("Add To Cart"),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    ),
  );
}
