import 'package:flutter/material.dart';

Widget buttonRow(){
  return Container(
    padding: const EdgeInsets.all(32.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        ElevatedButton(
           style: TextButton.styleFrom(
            primary: Colors.red,
          ),
          child: Text('Cancel'),
          onPressed: (){
          },
        ),
        SizedBox(width: 200,),
        ElevatedButton(
           style: TextButton.styleFrom(
            primary: Colors.green,
          ),
          child: Text('Done'),
          onPressed: (){
          },
        )
      ]
    ),  
  );
}