// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refka/view/forgotPass.dart';
import 'package:refka/view/signup.dart';
import 'package:refka/view/userInformation.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> PassKey = GlobalKey<FormState>();
  GlobalKey<FormState> EmailKey = GlobalKey<FormState>();
  TextEditingController passcontroller = TextEditingController();
  void Passvalidate() {
    if (PassKey.currentState!.validate() & EmailKey.currentState!.validate()) {
      print("Validated");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return userinfo();
          },
        ),
      );
    } else {
      print("not Validated");
    }
  }

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: "Enter a valid email"),
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Passwords must have at least one special character')
  ]);
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          //    crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /** Header Decration  */
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: screenSize.height * 0.33783783783,
                  child: Image.asset(
                    "assets/Group 1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Icon(
                    Icons.logout,
                    size: 70,
                  ),
                )
              ],
            ),
            /** Hello  */
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "Hello",
                  style: GoogleFonts.poppins(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    //color: Colors.orange,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
            /** Text */
            Center(
              child: Text(
                'Sign into your account',
                style: GoogleFonts.poppins(),
              ),
            ),
            /** Email input */
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  //height: 50,
                  width: 320,
                  child: Form(
                    key: EmailKey,
                    child: TextFormField(
                      validator: emailValidator,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            /** Passowrd Input */
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  //  height: 50,
                  width: 320,
                  child: Form(
                    key: PassKey,
                    child: TextFormField(
                      controller: passcontroller,
                      obscureText: isVisible,
                      validator: passwordValidator,
                      decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: isVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        labelText: "Passowrd",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            /** Forgot Pass  */
            Padding(
              padding: const EdgeInsets.only(left: 65.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return forPass();
                      },
                    ),
                  );
                },
                child: Text(
                  "Forgot your Password ! ",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            /** Sign in Button */
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: Passvalidate,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      //border: Border.all(),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 40,
                    width: 150,
                    // color: Colors.orange,
                    child: Center(
                      child: Text(
                        "Sign in ",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            /** Create account */
            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 50),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You Don't have an account ?"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return signup();
                            },
                          ),
                        );
                      },
                      child: Text(
                        " Sign up",
                        style: TextStyle(color: Colors.orange),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
