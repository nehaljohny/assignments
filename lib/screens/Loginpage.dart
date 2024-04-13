import 'package:assignments/screens/SignupPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
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
                        // Place your image widget at the top
                        Container(
                          height: 100, // adjust this value according to your image height
                          width: double.infinity, // occupy the full width
                          child: Image.network(
                            'https://images.pexels.com/photos/2409038/pexels-photo-2409038.jpeg?auto=compress&cs=tinysrgb&w=400',
                            fit: BoxFit.cover, // adjust how the image fits the container
                          ),
                        ),
                        // Add other widgets below the image
                        // For example:
                        // Text('Below the image'),
                    // Adding space at the top
                    Text("Welcome back",
                        style: GoogleFonts.cambo(
                            fontSize: 50, color: Colors.green)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Login To Your Account", style: GoogleFonts.sahitya()),
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
                        prefixIcon: Icon(Icons.lock_outlined),
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: 'Enter your password here',
                        helperText: 'Remember me'
                      ),
                    ),
                    const SizedBox(
                      height: 160,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.green,
                      minWidth: 200,
                      shape: const StadiumBorder(),
                      child: const Text("Login"),
                    ),
                    const SizedBox(height: 20), // Adjusted spacer
                    RichText(
                      text: TextSpan(
                        text: "Don't have an Account?",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                              },
                            text: " SignUp",
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
