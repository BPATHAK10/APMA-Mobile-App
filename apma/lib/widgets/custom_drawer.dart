import 'package:apma/screens/home_screen.dart';
import 'package:apma/screens/login_screen.dart';
import 'package:apma/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apma/Boxes/boxes.dart';
import 'package:url_launcher/url_launcher.dart';

Widget showDrawer(BuildContext context){
  final userEmail = Provider.of<String>(context,listen:false);
  final user = Boxes.getUsers().get(userEmail);
  return  Drawer(
    child: ListView(
      children: <Widget>[
        const DrawerHeader(
          child: Text('APMA'),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: ()async{
            await Navigator.pushReplacement(
              context,
                MaterialPageRoute(builder: (context) => Provider<String>(
                    create: (context) => user!.email,
                    child: HomeScreen())
                )
            );
          }  
        ),
        ListTile(
          title: const Text('My History'),
          onTap: () async{
            await Navigator.pushReplacement(
              context,
                MaterialPageRoute(builder: (context) => Provider<String>(
                    create: (context) => user!.email,
                    child: const HistoryScreen())
                )
            );
          },
        ),
        // ListTile(
        //   title: const Text('Settings'),
        //   onTap: () async{
        //     await Navigator.pushReplacement(
        //       context,
        //         MaterialPageRoute(builder: (context) => Provider<String>(
        //             create: (context) => user!.email,
        //             child: const SettingScreen())
        //         )
        //     );
        //   } 
        // ),
        ListTile(
          title: const Text('Terms of Reference'),
          onTap: () async{
            final Uri _url = Uri.parse('https://www.painmanagement.org.au/terms-of-reference-for-apma-app');
            if (!await launchUrl(_url)) throw 'Could not launch $_url';
          } 
        ),
        ListTile(
          title: const Text('Privacy Policy'),
          onTap: () async{
            final Uri _url = Uri.parse('https://www.painmanagement.org.au/terms-of-reference-for-apma-app');
            if (!await launchUrl(_url)) throw 'Could not launch $_url';
          } 
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=>const LoginScreen())
            ); 
          },
        ),
      ],
    ),
  );
}