import 'package:apma/screens/login_screen.dart';
import 'package:apma/widgets/appbar.dart';
import 'package:apma/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

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
      body:SettingsList(
        sections: [
          CustomSettingsSection(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                ListTile(title: Text('My Profile'),),
                const SizedBox(height: 15,),
                ListTile(title: Text('My Profile'),),
              ],
            )
          ),
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: const Icon(Icons.format_paint),
                title:const Text('Enable Dark Theme'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}