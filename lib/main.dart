import 'package:dependency_injection/locator.dart';
import 'package:dependency_injection/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  //Step-4
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: "Posts",
      ),
    );
  }
}
