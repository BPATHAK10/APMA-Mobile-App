import 'package:flutter/material.dart';

PreferredSizeWidget showAppBar(String title){
  return AppBar(
    centerTitle: false,
    title: Row(
      children: [
        Text(
          title,
        ),
        const SizedBox(width: 300,),
        Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
      ],
    ),
  );
}