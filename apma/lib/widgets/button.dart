import 'package:flutter/material.dart';

Widget buttonRow(BuildContext context){
  return Container(
    padding: const EdgeInsets.all(32.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
            shadowColor: Colors.redAccent,
            elevation: 3,
            minimumSize: const Size(100, 50),
          ),
          child: const Text('Cancel'),
          onPressed: (){
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width/2),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            onPrimary: Colors.white,
            shadowColor: Colors.greenAccent,
            elevation: 3,
            minimumSize: const Size(100, 50),
          ),
          child: const Text('Done'),
          onPressed: (){
          },
        )
      ]
    ),  
  );
}