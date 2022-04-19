import 'package:flutter/material.dart';

Widget buttonRow(BuildContext context){
  return Container(
    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF671616),
            onPrimary: Colors.white,
            shadowColor: Colors.redAccent,
            elevation: 3,
            minimumSize: const Size(100, 50),
          ),
          child: const Text('Cancel'),
          onPressed: (){
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF197B0C),
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