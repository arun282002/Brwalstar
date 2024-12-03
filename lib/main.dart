import 'package:brawlstar/Screens/brawlersscreen.dart';
import 'package:brawlstar/Screens/eventScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brawl Star',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        primaryColor: Color(0xffb9e4c9),

      ),
      // theme: ThemeData(
      //   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      routes: {
        '/Home':(context)=>Homescreen(),
        '/Brawlers':(context)=>Brawlersscreen(),
        '/Events':(context)=>eventScreen(),
      },
      home: Homescreen(),
    );
  }
}

