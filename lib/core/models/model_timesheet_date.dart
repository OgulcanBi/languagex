import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:languagex/core/models/model_user_wbs.dart';

@jsonSerializable
class ModelTimesheetDate {
  final DateTime date;
  final List<ModelTimesheetController> controllers;

  int get totalHours {
    int hours = 0;
    if (controllers.isNotEmpty) {
      for (var controller in controllers) {
        hours += int.tryParse(controller.controller.text) ?? 0;
      }
    }
    return hours;
  }

  ModelTimesheetDate({required this.date, required this.controllers});
}

@jsonSerializable
class ModelTimesheetController {
  ModelUserWBS wbs;
  late final TextEditingController controller;
  late final FocusNode focusNode;
  bool isEnabled;

  ModelTimesheetController({required this.wbs, this.isEnabled = true}) {
    controller = TextEditingController();
    focusNode = FocusNode();
  }
}
