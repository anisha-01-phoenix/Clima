import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ClimaApp());
}

class ClimaApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
