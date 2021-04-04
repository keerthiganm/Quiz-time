import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: QuizPage(),
    );
  }
}

Brain brain = Brain();

class QuizPage extends StatefulWidget {
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int amnt = 0;
  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = brain.getCorrectAnswer();

    setState(() {
      if (brain.isFinished() == true) {
        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        amnt = amnt + 1000;
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'Congrats,You\'ve scored Rs $amnt',
        ).show();
        brain.reset();
        amnt = 0;
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          amnt = amnt + 1000;
          Alert(
            context: context,
            title: 'correct answer!',
            desc: 'You\'ve scored Rs $amnt',
          ).show();
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          Alert(
            context: context,
            title: 'oops wrong :(',
            desc: 'correct answer $correctAnswer',
          ).show();
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        brain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    brain.getqs(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  child: Text(brain.getchoice1()),
                  onPressed: () {
                    //The user picked choice1.
                    checkAnswer(brain.getchoice1());
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  child: Text(brain.getChoice2()),
                  onPressed: () {
                    //The user picked choice2.
                    checkAnswer(brain.getChoice2());
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  child: Text(brain.getchoice3()),
                  onPressed: () {
                    //The user picked choice3.
                    checkAnswer(brain.getchoice3());
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  child: Text(brain.getChoice4()),
                  onPressed: () {
                    //The user picked choice4.
                    checkAnswer(brain.getChoice4());
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
