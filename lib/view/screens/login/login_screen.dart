import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mystore/view/screens/product/product_list_screen.dart';
import 'package:mystore/view/screens/signup/signup_screen.dart';
import '../../components/button_Screen.dart';
import '../../components/constants.dart'; // Ensure the correct import path

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String email = '';
  String password = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email and password cannot be empty.')),
      );
      return;
    }

    setState(() {
      showSpinner = true;
    });

    try {
      Response response = await post(
        Uri.parse('https://fa26-118-67-218-70.ngrok-free.app/api/user/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var role = data['user']['role']['roleName']; // Assuming the role is nested under 'user' and 'role'
        print('Role: $role');
        var token = data['token'];
        print(token);
        print('Login Successful');

        // Navigate to the Product List screen on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Product_List(roleName: role)),
        );
      } else {
        print('Failed');

        // Show a notification if login fails
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please check your email and password.')),
        );
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.')),
      );
    } finally {
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('assets/images/splash.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 48.0),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.start,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF210C35),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            RoundedButton(
              title: 'Login',
              colour: const Color(0xFF210C35),
              onPressed: () {
                login(emailController.text.toString(), passwordController.text.toString());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignupScreen.id);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFF210C35),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
