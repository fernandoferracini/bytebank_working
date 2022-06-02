import 'package:flutter/material.dart';
import 'package:bytebank/screens/dashboard.dart';

void main() {
  runApp(BytebankApp());  
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}
