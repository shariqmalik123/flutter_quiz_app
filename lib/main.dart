// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/Quiz_page.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Quiz(),
    );
  }
}

