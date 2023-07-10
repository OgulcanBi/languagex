import '../models/question.dart';

class QuizHelper {
  int _questionNumber = 0;

  List<Question> _questionList = [
    Question('The capital of Turkey is Ankara.', "A"),
    Question('Water boils at 100 degrees Celsius.', "B"),
    Question('Flutter is an open source framework by Google.', "C"),
    Question('First month of the year is February.', "C"),
    Question('The last day of the week is Tuesday.', "D"),

  ];

  void nextQuestion() {
    if (_questionNumber < _questionList.length - 1) {
      _questionNumber++;
    }
  }

  double? loadingProcessValue() {
    return _questionNumber / _questionList.length;
  }

  String getQuestionText() {
    return _questionList[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionList[_questionNumber].questionAnswer;
  }


  bool isFinished() {
    if (_questionNumber >= _questionList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}