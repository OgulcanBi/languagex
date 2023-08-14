import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:languagex/core/secrets.dart';
import 'package:languagex/ui/base/base_view_model.dart';

import '../../../core/enums/enum_app.dart';
import '../../../core/resources/_r.dart';
import '../../../core/services/service_api.dart';
import 'models/question.dart';

class ViewModelFragmentTest extends ViewModelBase {
  final ServiceApi serviceApi;
  final ScrollController scrollController = ScrollController();
  double scrollPadding = 0.0;
  final double topBarSize;
  final openAI = OpenAI.instance.build(token: openAIAPIKey, baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)), isLog: true);
  bool? isCorrect;
  String? userPickedAnswer;
  final List<StatefulWidget> fragments = [];

  ViewModelFragmentTest(this.topBarSize, this.serviceApi) {
    initListeners();
    init();
  }

  Color getOptionColor(String option){
    if(userPickedAnswer==null||option!=userPickedAnswer)
      return R.color.white;
    if(userPickedAnswer == getCorrectAnswer())
      return R.color.success;
    return R.color.error;
  }

  Future<void> init() async {
    //checkText("");x
  }

  void initListeners() {
    var tabBarHeight = const TabBar(tabs: []).preferredSize.height;
    scrollController.addListener(
      () {
        scrollPadding = scrollController.position.pixels > tabBarHeight * 4 + topBarSize ? tabBarHeight : 0.0;
        notifyListeners();
      },
    );
  }

  int  questionNumber = 0;

  List<Question> questionList = [
    Question('We would never have had the accident if you ______ so fast.', "B",["wouldn't been driving","hadn't been driving","had driven","wouldn't drive"]),
    Question('If only I ______ richer.', "B",["am","were","would be","will be"]),
    Question('The doctor gave me a ______ for some medicine yesterday.', "C",["note","receipt","prescription","recipe"]),
    Question('______ to school yesterday?', "C",["Do you walk","Did you walked","Did you walk","Have you walked"]),
    Question('You ______ better see a doctor.', "D",["did","would","should","had"]),
    Question('Would you mind ______ the window?', "A",["closing","close","to close","closed"]),
    Question('It ______ my brother.', "A",["is ages that I didn't see","is ages since I saw","was ages that I haven't seen","was ages since I saw"]),
    Question('When Simon ______ back tonight, he will cook dinner.', "A",["comes","will come","come","shall come"]),
    Question('If only I ______ richer.', "B",["am","were","would be","will be"]),
    Question('You ______ better see a doctor.', "D",["did","would","should","had"]),
    Question('______ to school yesterday?', "C",["Do you walk","Did you walked","Did you walk","Have you walked"]),
    Question('The doctor gave me a ______ for some medicine yesterday.', "C",["note","receipt","prescription","recipe"]),

  ];

  void nextQuestion() {
    if (questionNumber < questionList.length - 1) {
      questionNumber++;
    }
  }
  void passedQuestion() {
    if (questionNumber >0) {
      questionNumber--;
    }
  }

  double? loadingProcessValue() {
    return questionNumber / questionList.length;
  }

  String getQuestionText() {
    return questionList[questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return questionList[questionNumber].questionAnswer;
  }


  bool isFinished() {
    if (questionNumber >= questionList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    questionNumber = 0;
    userPickedAnswer = null;
    isCorrect = null;

  }



  Future<String> checkText(String text) async {
    String ptext ="give me json formatted text c1 level english grammar. dont format content";

    final request = CompleteText(prompt: ptext + text, model: Model.kTextDavinci3, maxTokens: 200);

    setActivityState(ActivityState.isLoading);
    final CTResponse? response = await openAI.onCompletion(request: request);
    setActivityState(ActivityState.isLoaded);
    return response!.choices[0].text;
  }
//"give me json formatted text c1 level english grammar. dont format content"
//  void chatCompleteWithSSE() {
//     final request = ChatCompleteText(messages: [
//       Map.of({"role": "user", "content": 'Hello!'})
//     ], maxToken: 200, model: ChatModel.chatGptTurboModel);
//
//     openAI.onChatCompletionSSE(request: request).listen((it) {
//       debugPrint(it.choices.last.message?.content);
//     });
//   }
}
