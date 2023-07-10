import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  final String questionText;

  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        widget.questionText,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ), //Text
    ); //Container
  }
}
