// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refka/view/home_page.dart';
import 'package:refka/view/userInformation.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  GlobalKey<FormState> UserKey = GlobalKey<FormState>();
  GlobalKey<FormState> PhoneKey = GlobalKey<FormState>();
  GlobalKey<FormState> NewPassKey = GlobalKey<FormState>();
  GlobalKey<FormState> NewEmailKey = GlobalKey<FormState>();
  TextEditingController Newpasscontroller = TextEditingController();
  void Passvalidate() {
    if (NewPassKey.currentState!.validate() &
        NewEmailKey.currentState!.validate() &
        UserKey.currentState!.validate() &
        PhoneKey.currentState!.validate()) {
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

  final phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'Phone Number is required'),
    MinLengthValidator(5, errorText: 'Enter a valid number'),
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: "Enter a valid email"),
  ]);
  final userValidator = MultiValidator([
    RequiredValidator(errorText: 'Username is required'),
    //EmailValidator(errorText: "Enter a valid email"),
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
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: screenSize.height * 0.337,
                  child: Image.asset(
                    "assets/Group 1.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    maxRadius: 50,
                    child: Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.black,
                    ),
                  ),
                ),
                //CircleAvatar(
                // child: Icon(Icons.add),
                // )
              ],
            ),
            /** Text */
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Text(
                  'Create Account',
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
            /** UserName Input */
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: 320,
                  child: Form(
                    key: UserKey,
                    child: TextFormField(
                      validator: userValidator,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.person),
                        labelText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            /** Phone Input */
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: 320,
                  child: Form(
                    key: PhoneKey,
                    child: TextFormField(
                      validator: phoneValidator,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.phone),
                        labelText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            /** Email input */
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: 320,
                  child: Form(
                    key: NewEmailKey,
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
                    key: NewPassKey,
                    child: TextFormField(
                      controller: Newpasscontroller,
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

            /** Sign up Button */
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
                        "Sign up ",
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
                    Text("You have an account ?"),
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
                        " Log In",
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
