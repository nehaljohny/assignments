import 'package:assignments/screens/Loginpage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              //to avoid scrollable action
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(children: [
                    const SizedBox(height: 50), // Adding space at the top
                    Text("Register",
                        style: GoogleFonts.cambo(
                            fontSize: 50, color: Colors.green)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Create your new account", style: GoogleFonts.sahitya()),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        border: OutlineInputBorder(),
                        labelText: "Full Name",
                        hintText: 'Enter your name here',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: 'Enter your email here',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outlined),
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          hintText: 'Enter your password here',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outlined),
                          border: OutlineInputBorder(),
                          labelText: "Confirm Password",
                          hintText: 'Enter your password here',
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.green,
                      minWidth: 200,
                      shape: const StadiumBorder(),
                      child: const Text("SignUp"),
                    ),
                    const SizedBox(height: 20), // Adjusted spacer
                    RichText(
                      text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                              },
                            text: " Login",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ))));
  }
}
