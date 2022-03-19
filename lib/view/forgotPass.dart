// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, file_names, sized_box_for_whitespace, non_constant_identifier_names, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refka/view/home_page.dart';
import 'package:refka/view/userInformation.dart';

class forPass extends StatefulWidget {
  forPass({Key? key}) : super(key: key);

  @override
  State<forPass> createState() => _forPassState();
}

class _forPassState extends State<forPass> {
  GlobalKey<FormState> VefEmailKey = GlobalKey<FormState>();
  final VeremailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: "Enter a valid email"),
  ]);
  void EmailPassvalidate() {
    if (VefEmailKey.currentState!.validate()) {
      print("Validated");
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Your Password has been sent on your email"),
          actions: [
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return userinfo();
                      },
                    ),
                  );
                },
                child: Text(
                  'Login to your account',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      print("not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            /** Header Decration  */
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: screenSize.height * 0.337,
                  child: Image.asset(
                    "assets/Group 1.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Icon(
                    Icons.password,
                    size: 70,
                    color: Colors.black,
                  ),
                ),
                //CircleAvatar(
                // child: Icon(Icons.add),
                // )
              ],
            ),
            /** Text */
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 50),
              child: Text(
                'Forgot',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                'Password ?',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 50),
              child: Text(
                'Enter the email address associated with your account . ',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 50),
              child: Text(
                'We will email you a vervication code to check your authenticity . ',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            /** Email Input */

            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  //height: 50,
                  width: 320,
                  child: Form(
                    key: VefEmailKey,
                    child: TextFormField(
                      validator: VeremailValidator,
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
            /** Send Button */
            /** Sign up Button */
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: EmailPassvalidate,
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
                        "Send ",
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
            /** Login*/

            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 50),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Remember your Password ?"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return HomePage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "  Login",
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
