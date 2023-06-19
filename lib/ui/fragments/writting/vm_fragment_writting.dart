import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:languagex/ui/base/base_view_model.dart';

import '../../../core/constant/constant_sort.dart';
import '../../../core/models/model_dropdown.dart';
import '../../../core/models/model_forecast_approvement_with_definition_list.dart';
import '../../../core/models/model_user_wbs.dart';
import '../../../core/resources/_r.dart';
import '../../../core/services/service_api.dart';
import '../speaking/secrets.dart';

class ViewModelFragmentWritting extends ViewModelBase {
  final ServiceApi serviceApi;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final double topBarSize;
  ModelDropdown? selectedSort;
  ModelDropdown? selectedStatus;
  ModelUserWBS? selectedWBS;
  bool? searchFilter;
  List<ModelForecastApprovementWithDefinition> list = [];
  late ResponseForecastApproval forecastApproval;
  List<ModelForecastApprovementWithDefinition> _originalList = [];
  final ConstantSort constantSort = ConstantSort.getInstance();
  List<ModelDropdown> timePeriodList = [ModelDropdown(id: 0, title: R.string.all)];
  final TextEditingController descriptionController = TextEditingController();
  final openAI = OpenAI.instance.build(token: openAIAPIKey, baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)), isLog: true);

  ViewModelFragmentWritting(this.topBarSize, this.serviceApi);

  Future<String> checkText(String text) async {
    final request = CompleteText(prompt: 'show my mistakes on this essay'+text, model: Model.kTextDavinci3, maxTokens: 200);

    final CTResponse? response = await openAI.onCompletion(request: request);
    return response!.choices[0].text;
  }
}