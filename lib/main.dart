import 'package:flutter/material.dart';
import 'package:mystore/view/screens/product/product_list_screen.dart';
import 'package:mystore/view/screens/splash/splash_screen.dart';
import 'package:mystore/view/screens/login/login_screen.dart';
import 'package:mystore/view/screens/signup/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyStore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => Product_List(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        Product_List.id: (context) => Product_List(),
      },
    );
  }
}
