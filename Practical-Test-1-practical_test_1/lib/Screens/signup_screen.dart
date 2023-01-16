import 'package:e_commerce_product_app/Screens/login_screen.dart';
import 'package:e_commerce_product_app/config/colors.dart';
import 'package:e_commerce_product_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromARGB(123, 9, 1, 1).withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/signupImage.webp'),
              // image: NetworkImage(
              //     'https://img.freepik.com/premium-vector/postal-courier-with-stack-cardboard-boxes-delivery-worker-holding-note-cartoon-character-delivery-parcel-packages-illustration-white-background_257455-706.jpg?w=2000'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create Account',
                  style: GoogleFonts.lora(
                      color: CupertinoColors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 230, 223).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CupertinoTextFormFieldRow(
                        prefix: const Center(
                            child: Icon(
                          CupertinoIcons.person,
                          // color: Colors.black.with,
                        )),
                        placeholder: 'Enter Name',
                        placeholderStyle: TextStyle(
                            color:
                                Color.fromARGB(255, 2, 1, 1).withOpacity(.2)),
                        keyboardType: TextInputType.name,
                        keyboardAppearance: Brightness.dark,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: CupertinoColors.separator))),
                      ),
                      CupertinoTextFormFieldRow(
                        prefix: const Center(child: Icon(CupertinoIcons.mail)),
                        placeholder: 'Enter Email',
                        placeholderStyle: TextStyle(
                            color:
                                Color.fromARGB(255, 2, 1, 1).withOpacity(.2)),
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.dark,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: CupertinoColors.separator))),
                      ),
                      CupertinoTextFormFieldRow(
                        prefix: const Center(child: Icon(CupertinoIcons.lock)),
                        obscureText: true,
                        placeholder: 'Enter new Password',
                        placeholderStyle: TextStyle(
                            color:
                                Color.fromARGB(255, 2, 1, 1).withOpacity(.2)),
                        keyboardType: TextInputType.emailAddress,
                        keyboardAppearance: Brightness.dark,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CupertinoButton(
                      color: primaryColor,
                      child: const FittedBox(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ),
                        );
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: RichText(
                  text: TextSpan(
                      text: "Already have an Account , Sign in now!",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      style: const TextStyle(
                        color: Color.fromARGB(255, 232, 227, 231),
                      )),
                ))
              ],
            ),
          ),
        ));
  }
}
