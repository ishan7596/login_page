import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.7,
                fit: BoxFit.cover,
                image: AssetImage("assets/plant.jpg")),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Lottie.asset("assets/79952-successful.json"),
              Text(
                "Login Successfull",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Data Saved in Database successfully!!",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

            ],
          )),
    );
  }
}
