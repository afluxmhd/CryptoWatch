import 'package:crpto_watch/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'screens/price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0xFF001427)),
      home: const LoadingScreen(),
    );
  }
}
