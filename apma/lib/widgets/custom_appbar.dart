import 'package:flutter/material.dart';

PreferredSizeWidget showAppBar(BuildContext context,String title){
  return AppBar(
    centerTitle: false,
    title: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
        ),
        Image.asset(
          'assets/images/logo_withbg.png',
          fit: BoxFit.contain,
          height: 32,
        ),
      ],
    ),
  );
}