import 'package:flutter/material.dart';
import 'pages/IndexPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}
