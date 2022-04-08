import 'package:flutter/material.dart';

Widget buttonRow(BuildContext context){
  return Container(
    padding: const EdgeInsets.all(32.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor:Colors.red ,
          ),
          child: const Text('Cancel'),
          onPressed: (){
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width/2+50),
        ElevatedButton(
           style: TextButton.styleFrom(
            backgroundColor:Colors.green ,
          ),
          child: const Text('Done'),
          onPressed: (){
          },
        )
      ]
    ),  
  );
}