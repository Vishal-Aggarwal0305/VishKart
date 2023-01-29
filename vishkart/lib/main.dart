import 'package:e_commerce_product_app/Screens/bookmarkedItemPage.dart';
import 'package:e_commerce_product_app/Screens/cartPage.dart';
import 'package:e_commerce_product_app/config/colors.dart';
import 'package:e_commerce_product_app/drawer_side.dart';
import 'package:e_commerce_product_app/homepage.dart';
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
// void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var auth = FirebaseAuth.instance;
  var isLogin = false;
  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkIfLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLogin ? homeScreen() : SplashScreen());
  }
}



// flutter build apk --release