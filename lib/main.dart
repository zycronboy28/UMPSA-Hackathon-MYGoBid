import 'package:flutter/material.dart';
import 'package:mygobid/mainpage.dart';
import 'loginpage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my first App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 163, 251)),
        useMaterial3: false,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,  // Selected item color
          unselectedItemColor: Colors.black,  // Unselected item color
      ),),
      home: UsernameForm(),
    );
  }
}
