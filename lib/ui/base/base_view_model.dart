import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../../core/enums/enum_app.dart';
import '../../core/secrets.dart';

abstract class ViewModelBase extends ChangeNotifier {
  ActivityState activityState = ActivityState.isLoaded;
  ErrorProperty errorObserver = ErrorProperty();
  final openAI = OpenAI.instance.build(token: openAIAPIKey, baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)), isLog: true);

  void setActivityState(ActivityState state, [String errMsg = '']) {
    activityState = state;
    if (state == ActivityState.isLoading || state == ActivityState.isLoaded) {
      errMsg = '';
    } else {
      this.errorObserver.message = errMsg;
    }
    notifyListeners();
  }

  bool isLoading() {
    return activityState == ActivityState.isLoading;
  }

  Future<String> getGPTResult(String prompt) async {
    final request = CompleteText(prompt: prompt, model: Model.kTextDavinci3, maxTokens: 200);

    setActivityState(ActivityState.isLoading);
    final CTResponse? response = await openAI.onCompletion(request: request);
    setActivityState(ActivityState.isLoaded);
    return response!.choices[0].text;
  }

  bool isError() {
    return activityState == ActivityState.isError;
  }

  Future<void> handleApiError(dynamic error) async {
    activityState = ActivityState.isError;
    if (error is DioError) {
      errorObserver.message = error.message ?? '';
      if (error.response != null) {
        switch (error.response!.statusCode) {
          case 401:
            logout();
            break;
          default:
        }
      }
    } else {
      errorObserver.message = R.string.genericError;
    }
    notifyListeners();
  }

  void logout([bool isEnabledConfirm = true]) {
    errorObserver.activityErrorActionState = isEnabledConfirm ? ActivityErrorActionState.gotoLogin : ActivityErrorActionState.logout;
  }
}

class ErrorProperty extends PropertyChangeNotifier<String> {
  String _message = '';
  ActivityErrorActionState _activityErrorActionState = ActivityErrorActionState.none;

  String get message => _message;

  ActivityErrorActionState get activityErrorActionState => _activityErrorActionState;

  set message(String value) {
    _message = value;
    notifyListeners('message');
  }

  set activityErrorActionState(ActivityErrorActionState value) {
    _activityErrorActionState = value;
    notifyListeners('activityErrorActionState');
  }
}
