import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 60.0),
            child: Center(
              child: Container(
                child: Text(
                  "Welcome!",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
            child: TextField(
              onChanged: (value) {
                // username = value;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your email address',
                  hintText: 'Enter email'),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 40.0),
            child: TextField(
              onChanged: (value) {
                // password = value;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                  hintText: 'Enter password'),
            ),
          ),
          SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SignInButton(
                
                Buttons.GoogleDark,
                onPressed: () {},
                text: "Sign Up",
              ),
            ),
          ),
          SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SignInButton(Buttons.Facebook,
                  onPressed: () {}, text: "Continue with Facebook"),
            ),
          ),
          SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SignInButton(Buttons.AppleDark,
                  onPressed: () {}, text: "Sign in with Apple"),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Already have an account?")),
          SizedBox(
            width: 250.0,
            child: ElevatedButton(

                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.all(0.0),
                  
                ),
                child: Text("Sign in",)),
          )
        ],
      ),
    );
  }
}
