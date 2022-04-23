import 'package:apma/screens/home_screen.dart';
import 'package:apma/screens/login_screen.dart';
import 'package:apma/screens/settings_screen.dart';
import 'package:flutter/material.dart';

Widget showDrawer(BuildContext context){
  return  Drawer(
    child: ListView(
      children: <Widget>[
        const DrawerHeader(
          child: Text('APMA'),
        ),
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
          title: const Text('My History'),
          onTap: () {
          },
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
          title: const Text('Logout'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=> LoginScreen())
            ); 
          },
        ),
      ],
    ),
  );
}