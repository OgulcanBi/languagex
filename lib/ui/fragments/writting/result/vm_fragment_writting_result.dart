import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/ui/base/base_view_model.dart';

import '../../../../core/services/service_api.dart';
import '../../speaking/secrets.dart';



class ViewModelFragmentWritingResult extends ViewModelBase {
  final ServiceApi serviceApi;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final double topBarSize;
  final openAI = OpenAI.instance.build(token: openAIAPIKey, baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)), isLog: true);

  ViewModelFragmentWritingResult(this.topBarSize, this.serviceApi);

  Future<String> checkText(String text) async {
    final request = CompleteText(prompt: 'show my mistakes on this essay'+text, model: Model.kTextDavinci3, maxTokens: 200);

    setActivityState(ActivityState.isLoading);
    final CTResponse? response = await openAI.onCompletion(request: request);
    setActivityState(ActivityState.isLoaded);
    return response!.choices[0].text;
  }
}