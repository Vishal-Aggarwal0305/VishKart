import 'package:e_commerce_product_app/Screens/signin_screen.dart';
import 'package:e_commerce_product_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Model/reusable_widget.dart';
import '../config/color_utils.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _cpasswordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _cpasswordTextController.dispose();
    _userNameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("336600"),
            hexStringToColor("47e149"),
            hexStringToColor("006602")
            // hexStringToColor("CB2B93"),
            // hexStringToColor("9546C4"),
            // hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/VishKartWhite.png"),
                const SizedBox(
                  height: 30,
                ),
                // children: <Widget>[
                //   const SizedBox(
                //     height: 20,
                //   ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Confirm Password", Icons.lock_outlined, true,
                    _cpasswordTextController),
                const SizedBox(
                  height: 20,
                ),

                firebaseUIButton(context, "Sign Up", () async {
                  //  User? user = FirebaseAuth.instance.currentUser;
                  // await user!.sendEmailVerification();

                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     backgroundColor: Color.fromARGB(255, 86, 154, 87),
                  //     duration: Duration(seconds: 3),
                  //     content: Text(
                  //       "Verification Email Sent! Verify and Relogin",
                  //       style: TextStyle(
                  //           fontSize: 14.0,
                  //           color: Color.fromARGB(255, 255, 255, 255)),
                  //     ),
                  //   ),
                  // );

                  if (_userNameTextController.text.length < 6) {
                    print("Username should be atleast 6 characters");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color.fromARGB(255, 86, 154, 87),
                        content: Text(
                          "Enter Username of atleast 6 characters",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromARGB(255, 252, 252, 252)),
                        ),
                      ),
                    );
                  } else if (_passwordTextController.text !=
                      _cpasswordTextController.text) {
                    print("Password and Confirm Password doesn't match");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color.fromARGB(255, 86, 154, 87),
                        content: Text(
                          "Password and Confirm Password doesn't match",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromARGB(255, 252, 252, 252)),
                        ),
                      ),
                    );
                  } else {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      )
                          .then((value) {
                        print("Created New Account");

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromARGB(255, 86, 154, 87),
                            content: Text(
                              "Account Created Succesfully! Please Login",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        );

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print("Password Provided is too Weak");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromARGB(255, 86, 154, 87),
                            content: Text(
                              "Password Provided is too Weak",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        );
                      } else if (e.code == 'email-already-in-use') {
                        print("Account Already exists");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromARGB(255, 86, 154, 87),
                            content: Text(
                              "Account Already exists",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 247, 247, 247)),
                            ),
                          ),
                        );
                      }
                      //    await user!.sendEmailVerification();

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       backgroundColor: Color.fromARGB(255, 86, 154, 87),
                      //       duration: Duration(seconds: 3),
                      //       content: Text(
                      //         "Verification Email Sent! Verify and Relogin",
                      //         style: TextStyle(
                      //             fontSize: 14.0,
                      //             color: Color.fromARGB(255, 255, 255, 255)),
                      //       ),
                      //     ),
                      //   );
                    }
                  }
                }),
              ],
            ),
          ))),
    );
  }
}
