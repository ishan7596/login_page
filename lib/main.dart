import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.green,
        brightness: Brightness.dark,

        inputDecorationTheme: InputDecorationTheme(
          labelStyle: GoogleFonts.montserrat(
              fontSize: 20,
              color: Colors.green.shade900,
              fontWeight: FontWeight.bold),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
