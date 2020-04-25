import 'package:flutter/material.dart';

Widget myAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(80.0),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor
          ),
          title: Image.asset(
            'assets/logo-horizontal.png',
            fit: BoxFit.scaleDown,
            height: 50.0,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    ),
  );
}
