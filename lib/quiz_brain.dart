import 'questions.dart';


class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionbank =[
 Question('Hashirama is the first Hokage', true),
    Question('Naruto passed the chunin exam ?', false),
    Question('Sai is a part of team 7', true),
    Question('Itachi Slaughtered The Uchiha clan ?', true),
    Question('Kakashi is known as the copy Ninja ?', true),
    Question('Sakumo is father of Kakashi ?', true),
    Question(
        'Danzo Killed Shisui Uchiha ?',
        false),
    Question(
        'White fang was Stronger Than the Ninja Sanins ?',
        true),
    Question(
        'Third Hokage is known as the yellow Flash ?',
        false),
    Question(
        'Obito was student of The Yellow Flash of Leaf ?',
        true),
    Question('Might Gai is The Strongest Tai jutsu user ever ?', true),
    Question(
        'Himawari is the Daughter of Naruto and Hinata ?',
        true),
    Question(
        'Kakashi taught Chidori to Sasuke ?',
        true),
];

void nxtQuestion()
{
  if(_questionNumber < _questionbank.length-1)
  {
    _questionNumber++;
  }
  print(_questionNumber);
  print(_questionbank.length);
}
String getQuestionText(){
  return _questionbank[_questionNumber].questionsintext;
}

bool getCorrectAnswers(){
      return _questionbank[_questionNumber].questionanswers;
}
bool isFinished() {
    if(_questionNumber >= _questionbank.length-1)
    {
        print('Now returning true');
        return true;
    }
    else {
      return false;
    }
}
void reset()
{
  _questionNumber = 0;
}

}
