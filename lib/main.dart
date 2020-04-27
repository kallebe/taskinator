import 'package:flutter/material.dart';
import 'package:taskinator/screens/home_page_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromRGBO(17, 39, 128, 1.0),
        accentColor: Color.fromRGBO(147, 229, 145, 1.0)
      ),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child
      ),
      home: HomePage(),
    );
  }
}
