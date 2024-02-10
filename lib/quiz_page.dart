// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'quiz_brain.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.grey.shade900,
        leading: IconButton(
          onPressed: () {
            // quizBrain.previousQuestion();
            // setState(() {});
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                //checking the answer if correct or not
                //when the user pick true.
                if (quizBrain.getQuestionAnswer() == true) {
                  print('correct answer');
                  scoreKeeper.add(
                    Icon(Icons.check, color: Colors.green),
                  );
                } else {
                  print('wrong answer');
                  scoreKeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                //now for if u wanna update to next question
                // along with rebuilding the UI. Here u go.
                quizBrain.nextQuestion();
                setState(() {});
              },
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    "True",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                //when the user pick false.
                if (quizBrain.getQuestionAnswer() == false) {
                  print('correct answer');
                  scoreKeeper.add(Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                } else {
                  print('incorect answer');
                  scoreKeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                quizBrain.nextQuestion();
                setState(() {});
              },
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        //TO indicates whether the
        //answer is correct or not we will add a row.
        Row(children: scoreKeeper),
      ],
    );
  }
}
