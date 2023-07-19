import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:languagex/core/constant/prompts.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/ui/base/base_view_model.dart';

import '../../../core/secrets.dart';
import '../../../core/services/service_api.dart';

class ViewModelFragmentWriting extends ViewModelBase {
  final ServiceApi serviceApi;
  final ScrollController scrollController = ScrollController();
  final double topBarSize;

  final TextEditingController descriptionController = TextEditingController();
  final openAI = OpenAI.instance.build(token: openAIAPIKey, baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)), isLog: true);

  ViewModelFragmentWriting(this.topBarSize, this.serviceApi);

  int countWords(String? text) {
    if (text == null || text.isEmpty) {
      return 0;
    }

    // Split the string into words based on whitespace characters
    List<String> words = text.trim().split(RegExp(r'\s+'));

    // Return the count of words
    return words.length;
  }

  Future<String> checkText(String text) async {
    final request = CompleteText(prompt: writingPrompt + text, model: Model.kTextDavinci3, maxTokens: 200);

    setActivityState(ActivityState.isLoading);
    final CTResponse? response = await openAI.onCompletion(request: request);
    setActivityState(ActivityState.isLoaded);
    return response!.choices[0].text;
  }
}