import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';


QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
List<Widget> scoreKeeper = [];
void checkAnswers(bool userPickedAnswers)
{
 bool correctanswers = quizBrain.getCorrectAnswers();

                 setState(() {
              if(quizBrain.isFinished() == true)
              {
                Alert(
                  context: context,
                   title: "FINISHED",
                    desc: "quiz is over",
                    ).show();
                quizBrain.reset();
                scoreKeeper = [];            
              }
              else {
                if(userPickedAnswers == correctanswers)
                {
                  scoreKeeper.add(Icon(Icons.check,color: Colors.green));
                }
                else 
                {
                 scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
                }
                              quizBrain.nxtQuestion() ; 
                  }
                            });
}

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
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
               padding: const EdgeInsets.all(16.0),
                    primary: Colors.blue,
                    textStyle: const TextStyle(fontSize: 20),  
              ),
              onPressed: () {
                //The user picked true.
                   checkAnswers(true);  
              }, child: Text(
                'True', style: TextStyle( fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                //The user picked false.
               checkAnswers(false);
                
              }, child: Text(
                'False', style: TextStyle(fontSize: 20.0, color: Colors.blue),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}