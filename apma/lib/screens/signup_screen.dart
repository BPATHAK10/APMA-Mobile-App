import 'package:apma/models/user_model.dart';
import 'package:apma/screens/home_screen.dart';
import 'package:apma/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:apma/Boxes/boxes.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
              padding:const EdgeInsets.fromLTRB(
                15.0,
                20.0,
                15.0,
                0.0,
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter password',
                ),
                cursorColor: Colors.red,
                cursorRadius: const Radius.circular(8.0),
                cursorWidth: 8.0,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery. of(context). size. width-30,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () async{
                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please fill out all fields',
                        ),
                      ),
                    );
                    return;
                  }
                  final user = createUser(email, password);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Provider<String>(
                            create: (context) => user.email,
                            child: HomeScreen())
                      ));
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: Container(
            //         margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            //         child: const Divider(
            //           color: Colors.black,
            //           height: 50,
            //         )
            //       ),
            //     ),
    
            //     const Text("OR"),
    
            //     Expanded(
            //       child: Container(
            //         margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            //         child: const Divider(
            //           color: Colors.black,
            //           height: 50,
            //         )
            //       ),
            //     ),
            //   ]
            // ),
            // Container(
            //   height: 50,
            //   width: MediaQuery. of(context). size. width-80,
            //   margin: const EdgeInsets.only(top: 10),
            //   child: SignInButton(
            //     Buttons.GoogleDark,
            //     onPressed: () {},
            //     text: "Sign up with Google",
            //   ),
            // ),
            // Container(
            //   height: 50,
            //   width: MediaQuery. of(context). size. width-80,
            //   margin: const EdgeInsets.only(top: 10),
              
            //   child: SignInButton(
            //     Buttons.Facebook,
            //     onPressed: () {}, 
            //     text: "Continue with Facebook"
            //   ),
            // ),
            // Container(
            //   height: 50,
            //   width: MediaQuery. of(context). size. width-80,
            //   margin: const EdgeInsets.only(top: 10),
            //   child: SignInButton(
            //     Buttons.AppleDark,
            //     onPressed: () {},
            //     text: "Sign up with Apple"
            //   ),
            // ),
            const SizedBox(height: 30,),
            const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )
            ),
            Container(
              height: 40,
              width: MediaQuery. of(context). size. width-80,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () async{
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()
                      ));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  User createUser(String email, String password) {
    final user = User()
      ..email = email
      ..password = password
      ..name = ""
      ..age = ""
      ..gender = ""
      ..postCode = ""
      ..foodIllness = [];
      

    final userBox = Boxes.getUsers();
    try{
    userBox.put(user.email, user);
    }
    catch(e){
      print("sign up failed");
    }
    print("user created");

    // final currentUser = UserModel();
    // currentUser.updateUser(email);

    return user;
    // final users = userBox.values.toList().cast<User>();
    
    // for (var user in users) {
    //   print(user.email);
    //   print(user.password);
    //   print(user.age);
    //   print(user.contactNumber);
    //   print(user.gender);
    //   print(user.pains);
    //   print(user.medicines); 
    // }

  }
}
