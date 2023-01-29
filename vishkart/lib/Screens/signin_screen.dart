import 'package:e_commerce_product_app/Screens/reset_password.dart';
import 'package:e_commerce_product_app/Screens/signup_screen.dart';
import 'package:e_commerce_product_app/homepage.dart';
import 'package:e_commerce_product_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Model/reusable_widget.dart';
import '../config/color_utils.dart';
import '../providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // UserProvider userProvider;
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("aff8af"),
          hexStringToColor("33cc33"),
          hexStringToColor("336600")
          // hexStringToColor("CB2B93"),
          // hexStringToColor("9546C4"),
          // hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/VishKartWhite.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Mail Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Sign In", () async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homeScreen()));

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromARGB(255, 86, 154, 87),
                          duration: Duration(seconds: 2),
                          content: Text(
                            "Login Success",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      );
                    });
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print("No User Found for that Email");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromARGB(255, 86, 154, 87),
                          content: Text(
                            "No User Found for this Email",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 252, 252, 252)),
                          ),
                        ),
                      );
                    } else if (e.code == 'wrong-password') {
                      print("Wrong Password Provided by User");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromARGB(255, 86, 154, 87),
                          content: Text(
                            "Wrong Password",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      );
                    } else if (e.code == 'invalid-email') {
                      print("Invalid Email Entered");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromARGB(255, 86, 154, 87),
                          content: Text(
                            "Invalid Email Format",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      );
                    }
                  }
                  // User? user = FirebaseAuth.instance.currentUser;
                  // setState(() {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => SignInScreen()));
                  //   // updating the state
                  // });
                  // if (!user!.emailVerified) {
                  //   try {
                  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
                  //         email: _emailTextController.text,
                  //         password: _passwordTextController.text);
                  //   } on FirebaseAuthException catch (e) {
                  //     if (e.code == 'user-not-found') {
                  //       print("No User Found for that Email");
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromARGB(255, 86, 154, 87),
                  //           content: Text(
                  //             "No User Found for this Email",
                  //             style: TextStyle(
                  //                 fontSize: 14.0,
                  //                 color: Color.fromARGB(255, 252, 252, 252)),
                  //           ),
                  //         ),
                  //       );
                  //     } else if (e.code == 'wrong-password') {
                  //       print("Wrong Password Provided by User");
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromARGB(255, 86, 154, 87),
                  //           content: Text(
                  //             "Wrong Password",
                  //             style: TextStyle(
                  //                 fontSize: 14.0,
                  //                 color: Color.fromARGB(255, 255, 255, 255)),
                  //           ),
                  //         ),
                  //       );
                  //     } else if (e.code == 'invalid-email') {
                  //       print("Invalid Email Entered");
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromARGB(255, 86, 154, 87),
                  //           content: Text(
                  //             "Invalid Email Format",
                  //             style: TextStyle(
                  //                 fontSize: 14.0,
                  //                 color: Color.fromARGB(255, 255, 255, 255)),
                  //           ),
                  //         ),
                  //       );
                  //     }
                  //   }
                  // }
                  // if (!user!.emailVerified) {
                  //   await user.sendEmailVerification();
                  //   ScaffoldMessenger.of(context).showSnackBar(
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
                  // } else {
                  //   try {
                  //     await FirebaseAuth.instance
                  //         .signInWithEmailAndPassword(
                  //             email: _emailTextController.text,
                  //             password: _passwordTextController.text)
                  //         .then((value) {
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => MyApp()));
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromARGB(255, 86, 154, 87),
                  //           duration: Duration(seconds: 2),
                  //           content: Text(
                  //             "Login Success",
                  //             style: TextStyle(
                  //                 fontSize: 14.0,
                  //                 color: Color.fromARGB(255, 255, 255, 255)),
                  //           ),
                  //         ),
                  //       );
                  //     });
                  //   } on FirebaseAuthException catch (e) {
                  //     if (e.code == 'user-not-found') {
                  //       print("No User Found for that Email");
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromARGB(255, 86, 154, 87),
                  //           content: Text(
                  //             "No User Found for this Email",
                  //             style: TextStyle(
                  //                 fontSize: 14.0,
                  //                 color: Color.fromARGB(255, 252, 252, 252)),
                  //           ),
                  //         ),
                  //       );
                  //     } else if (e.code == 'wrong-password') {
                  //       print("Wrong Password Provided by User");
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromARGB(255, 86, 154, 87),
                  //           content: Text(
                  //             "Wrong Password",
                  //             style: TextStyle(
                  //                 fontSize: 14.0,
                  //                 color: Color.fromARGB(255, 255, 255, 255)),
                  //           ),
                  //         ),
                  //       );
                  //     } else if (e.code == 'invalid-email') {
                  //       print("Invalid Email Entered");
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: Color.fromARGB(255, 86, 154, 87),
                  //           content: Text(
                  //             "Invalid Email Format",
                  //             style: TextStyle(
                  //                 fontSize: 14.0,
                  //                 color: Color.fromARGB(255, 255, 255, 255)),
                  //           ),
                  //         ),
                  //       );
                  //     }
                  //   }
                  // } else {
                  //   await user.sendEmailVerification();

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
                  // }
                  // setState(() {
                  //    });
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SignInScreen()));
                  // updating the state

                  // .onError((error, stackTrace) {
                  //   print("Error ${error.toString()}");
                  // });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
