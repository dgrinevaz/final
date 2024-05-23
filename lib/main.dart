import 'package:flutter/material.dart';
import 'package:assignment/home_screen.dart';
import 'package:assignment/first_screen.dart';
import 'package:assignment/second_screen.dart';
import 'package:assignment/third_screen.dart';
import 'package:assignment/fourth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/first': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/fourth': (context) => const FourthScreen(),
      },
    );
  }
}
