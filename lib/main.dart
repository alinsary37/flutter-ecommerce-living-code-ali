import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utilities/router.dart';
import 'package:flutter_ecommerce/utilities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor:const Color(0xFFE5E5E5),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
            borderSide:const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
            borderSide:const BorderSide(color: Colors.grey),
          ),
        ),
      ),
      onGenerateRoute: onGenerate,
      initialRoute: AppRouts.loginPageRoute,
      home: Container(),
    );
  }
}
