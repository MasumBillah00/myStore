import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystore/view/components/button_screen.dart'; // Ensure the correct import path
import 'package:mystore/view/screens/signup/signup_screen.dart'; // Ensure the correct import path

import '../../components/constants.dart'; // Ensure the correct import path

class SignupScreen extends StatefulWidget {
  static const String id = 'SignUp_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  bool showSpinner = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Text('Create Account',style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF210C39)
            ),),

            SizedBox(height: 28.0),

            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your name',
              prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(height: 12.0),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email)),
            ),
            SizedBox(height: 12.0),
            TextField(
              obscureText: true,
              textAlign: TextAlign.start,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock),),
              
            ),
            SizedBox(height: 12.0),
            TextField(
              obscureText: true,
              textAlign: TextAlign.start,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Confirm your password',
                prefixIcon: Icon(Icons.lock),),
            ),
            SizedBox(height: 15.0),

            RoundedButton(
              title: 'Sign Up',
              colour: Color(0xFF210C35),
              onPressed: () {
                // Implement login functionality here
              },
            ),

            SizedBox(height: 10.0),
            // TextButton(
            //   onPressed: () {
            //     // Implement Google sign up functionality here
            //   },
            //   style: TextButton.styleFrom(
            //     backgroundColor: Colors.transparent,
            //     padding: EdgeInsets.all(15.0),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30.0),
            //       side: BorderSide(color: Color(0xFF210C35)),
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(
            //         FontAwesomeIcons.google,
            //         color: Color(0xFF210C35),
            //       ),
            //       SizedBox(width: 8.0),
            //       Text(
            //         'Sign up with Google',
            //         style: TextStyle(
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.w500,
            //           color: Color(0xFF210C35),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
