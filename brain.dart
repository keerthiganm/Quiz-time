import 'gamequestion.dart';
import 'answer.dart';

class Brain {
  int _questionNumber = 0;

  List<Question> _brain = [
    Question('What is the chemical symbol for silver?', 'Ag', 'Si', 'S', 'A'),
    Question('What is the world’s smallest bird?', 'crow', 'sparrow',
        'Humming bird', 'chicken'),
    Question('What is the lifespan of a dragonfly?', '1 month', '24 hours',
        '48 hours', '2 months'),
    Question('What is the hottest continent on Earth?', 'Africa', 'Asia',
        'North america', 'Europe'),
    Question(
        'Who was the youngest British Prime Minister?',
        'Neville Chamberlain',
        'Stanley Baldwin',
        'James Callaghan',
        'William Pitt '),
    Question(
        'Which is the first Indian Language to attain Classical Language Status?',
        'Malayalam',
        'Tamil',
        'Telugu',
        'kanadam'),
    Question(
        'The Bharat Ratna is the highest civilian award of the Republic of India. Who among the following is not the first recipients of the Bharat Ratna?',
        'C. Rajagopalachari',
        'Sarvepalli Radhakrishnan',
        'Jawaharlal Nehru',
        'C. V. Raman'),
    Question(
        'Who was the first Deputy Prime Minister of India?',
        'Sardar Vallabhai Patel',
        'Sarvepalli Radhakrishnan',
        'BR Ambedkar',
        'Raja Ram Mohan Roy'),
    Question(
        'Which of the following is the World’s First Granite Temple?',
        'Puri Jagannath temple',
        'Govindajee Temple',
        'Brihadeswara temple ',
        'Meenakshi Amman Temple'),
    Question(
        'What are the five colours of the Olympic rings?',
        'Blue, yellow, black, green and red',
        'Blue, yellow, pink, green and red',
        'Blue, yellow, orange, green and red',
        'pink, yellow, black, green and red')
  ];
  List<Answer> _answer = [
    Answer('Ag'),
    Answer('Humming bird'),
    Answer('24 hours'),
    Answer('Africa'),
    Answer('William Pitt '),
    Answer('Tamil'),
    Answer('Jawaharlal Nehru'),
    Answer('Sardar Vallabhai Patel'),
    Answer('Brihadeswara temple '),
    Answer('Blue, yellow, black, green and red'),
  ];
  String choice = '';
  String getqs() {
    return _brain[_questionNumber].qs;
  }

  String getchoice1() {
    choice = _brain[_questionNumber].choice1;
    return choice;
  }

  String getChoice2() {
    choice = _brain[_questionNumber].choice2;
    return choice;
  }

  String getchoice3() {
    choice = _brain[_questionNumber].choice3;
    return choice;
  }

  String getChoice4() {
    choice = _brain[_questionNumber].choice4;
    return choice;
  }

  void nextQuestion() {
    if (_questionNumber < _brain.length - 1) {
      _questionNumber++;
    }
  }

  String getCorrectAnswer() {
    return _answer[_questionNumber].answer;
  }

  bool isFinished() {
    if (_questionNumber >= _brain.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
