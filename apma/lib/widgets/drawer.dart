import 'package:apma/screens/home_screen.dart';
import 'package:apma/screens/login_screen.dart';
import 'package:apma/screens/pain_track_screen.dart';
import 'package:apma/screens/settings_screen.dart';
import 'package:flutter/material.dart';

Widget showDrawer(BuildContext context){
  return  Drawer(
    child: ListView(
      children: <Widget>[
        ListTile(
          title: const Text('Home'),
          onTap: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=> HomeScreen())
            );
          }  
        ),
        ListTile(
          title: const Text('Settings'),
          onTap: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=> SettingScreen())
            );
          } 
        ),
        ListTile(
          title: Text('Pain'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=> PainTrack())
            );
          },
        ),
        ListTile(
          title: Text('Your Stories'),
          onTap: () {
          },
        ),
        ListTile(
          title: const Text('Membership'),
          onTap: () {
          },
        ),
        ElevatedButton(
          onPressed:(){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=> LoginScreen())
            );
          }, 
          child: const Text('Logout')
        ),
      ],
    ),
  );
}