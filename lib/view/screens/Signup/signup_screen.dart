import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:mystore/view/components/button_screen.dart';
import 'package:mystore/view/screens/login/login_screen.dart';
import '../../components/constants.dart';
import '../product/product_list_screen.dart';

class SignupScreen extends StatefulWidget {
  static const String id = 'SignUp_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showSpinner = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signup(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name, email, and password cannot be empty.')),
      );
      return;
    }

    setState(() {
      showSpinner = true;
    });

    try {
      print('Sending request with:');
      print('Name: $name');
      print('Email: $email');
      print('Password: $password');

      Response response = await post(
        Uri.parse('https://d8cf-118-67-218-70.ngrok-free.app/api/user'),
        headers: {
          'Content-Type':'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print(data['token']);
        print('Registration Successful');

        // Navigate to the Product List screen on successful registration
        Navigator.pushNamed(context, Product_List.id);
      } else {
        print('Registration failed');
        // Show a notification if registration fails
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration failed. Please check your details and try again.')),
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/signup4.jpg'),
              fit: BoxFit.cover,
      
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 28.0,),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your name',
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 12.0,),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.start,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password',
                    prefixIcon:const Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 12,),
                // TextField(
                //   controller: passwordController,
                //   obscureText: true,
                //   textAlign: TextAlign.start,
                //   decoration: kTextFieldDecoration.copyWith(
                //     hintText: 'Confirm your password',
                //     prefixIcon: Icon(Icons.lock),
                //   ),
                // ),
                const SizedBox(height: 15.0,),
                RoundedButton(
                  title: 'Sign Up',
                  colour:  Colors.blue,
                  onPressed: () {
                    signup(
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Already have Account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
      
                      ),),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, LoginScreen.id);
      
                    },child: Text('Login',
                      style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
      
                    ),))
                  ],
                ),
                //const SizedBox(height: 10.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
