import 'package:flutter/material.dart';

PreferredSizeWidget showAppBar(BuildContext context,String title){
  return AppBar(
    centerTitle: false,
    title: Row(
      children: [
        Text(
          title,
        ),
        SizedBox(width: MediaQuery.of(context).size.width-50,),
        Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
      ],
    ),
  );
}