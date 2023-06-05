import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/ui/base/base_view_model.dart';

import '../../../core/constant/constant_sort.dart';
import '../../../core/models/model_dropdown.dart';
import '../../../core/models/model_forecast_approval.dart';
import '../../../core/models/model_forecast_approvement_with_definition_list.dart';
import '../../../core/models/model_user_wbs.dart';
import '../../../core/resources/_r.dart';
import '../../../core/services/service_api.dart';

class ViewModelFragmentFinance extends ViewModelBase {
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

  ViewModelFragmentFinance(this.topBarSize, this.serviceApi) {

  }
  }