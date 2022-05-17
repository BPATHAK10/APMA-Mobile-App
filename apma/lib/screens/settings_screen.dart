import 'package:apma/widgets/custom_appbar.dart';
import 'package:apma/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  
  const SettingScreen({ Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context,'Settings'),
      drawer: showDrawer(context),
      body:
        ListView(
          children: const [
            ExpansionTile(
              title: Text('Account Information'),
              children: [

              ],
            ),
            ExpansionTile(
              title: Text('My History'),
              children: [
                
              ],
            ),
            // ExpansionTile(
            //   title: Text('Security'),
            //   children: [
                
            //   ],
            // ),
            
            ExpansionTile(
              title: Text('Terms of Use'),
              children: [
                
              ],
            ),ExpansionTile(
              title: Text('About Us'),
              children: [
                
              ],
            ),
          ],
        )
    );
  }
}