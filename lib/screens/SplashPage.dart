import 'dart:async';

import 'package:assignments/homeListView/WateringList.dart';
import 'package:assignments/screens/Loginpage.dart';
import 'package:assignments/screens/SignupPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => WateringPlants_list()));
    });
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.pexels.com/photos/2409038/pexels-photo-2409038.jpeg?auto=compress&cs=tinysrgb&w=400"))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " The best app for your plants",
                    style: GoogleFonts.cambo(fontSize: 50, color: Colors.white),
                  ),
              SizedBox(height: 20.0),
                  MaterialButton(
                    color: Colors.white,
                    minWidth: 300,
                    shape: const StadiumBorder(),
                    child: const Text("SignUp"),
                onPressed: () {
                  // Navigate to login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
              ),
              SizedBox(height: 10.0),
                  MaterialButton(
                    color: Colors.green,
                    minWidth: 300,
                    shape: const StadiumBorder(),
                    child: const Text("Login"),
                onPressed: () {
                  // Navigate to sign up page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              )
                ],
              ),
            )));
  }
}
