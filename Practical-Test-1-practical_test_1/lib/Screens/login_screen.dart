import 'package:e_commerce_product_app/Screens/signup_screen.dart';
import 'package:e_commerce_product_app/config/colors.dart';
import 'package:e_commerce_product_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromARGB(123, 9, 1, 1).withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/loginImage.jpg'),
              // image: NetworkImage(
              //     'https://i.pinimg.com/736x/0b/01/6d/0b016db576f74b7f7b94d958ba618f79.jpg'),
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
                  'Welcome Back!',
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
                        prefix: const Center(child: Icon(CupertinoIcons.mail)),
                        placeholder: 'Email',
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
                        placeholder: 'Password',
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
                          'Login',
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
                      text: "Don't have an Account , Sign Up now!",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
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
