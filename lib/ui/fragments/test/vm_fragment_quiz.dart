import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:languagex/core/models/chatgpt_model.dart';
import 'package:languagex/ui/base/base_view_model.dart';
import 'package:languagex/core/secrets.dart';

import '../../../core/enums/enum_app.dart';
import '../../../core/services/service_api.dart';

class ViewModelFragmentTest extends ViewModelBase {
  final ServiceApi serviceApi;
  final ScrollController scrollController = ScrollController();
  double scrollPadding = 0.0;
  final double topBarSize;
  final openAI = OpenAI.instance.build(token: openAIAPIKey, baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)), isLog: true);

  final List<StatefulWidget> fragments = [];

  ViewModelFragmentTest(this.topBarSize, this.serviceApi) {
    initListeners();
    init();
//    chatCompleteWithSSE();
  }

  Future<void> init() async {
//    final request = CompleteText(prompt: 'bana 20 adet ingilizce sorusu sor, şıklar ve cevaplar ile', model: Model.kTextDavinci3, maxTokens: 200);
//
//     final CTResponse? response = await openAI.onCompletion(request: request);
//
//     print(response);
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

  void chatCompleteWithSSE() {
    final request = ChatCompleteText(messages: [
      Map.of({"role": "user", "content": 'Hello!'})
    ], maxToken: 200, model: ChatModel.chatGptTurboModel);

    openAI.onChatCompletionSSE(request: request).listen((it) {
      debugPrint(it.choices.last.message?.content);
    });
  }
}
