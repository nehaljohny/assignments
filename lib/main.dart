
import 'package:assignments/PlantApp/detailview/plant1.dart';
import 'package:assignments/PlantApp/detailview/plant2.dart';
import 'package:assignments/PlantApp/detailview/plant3.dart';
import 'package:assignments/PlantApp/detailview/plant4.dart';
import 'package:assignments/PlantApp/detailview/plant5.dart';
import 'package:flutter/material.dart';


import 'QuizApp/screens/SplashPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizSplash(),
      routes: {
        'Plant1': (context) => Plant1(),
        'Plant2': (context) => Plant2(),
        'Plant3': (context) => Plant3(),
        'Plant4': (context) => Plant4(),
        'Plant5': (context) => Plant5(),
      },
    );
  }
}
