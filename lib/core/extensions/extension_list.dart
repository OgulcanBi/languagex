import 'package:languagex/core/extensions/extension_string.dart';

import '../utils/general_data.dart';

extension ExtensionList on List? {
  bool get isNullOrEmpty => !isNotNullOrEmpty;

  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;

  bool _hasPermission() {
    List<String> permissions = GeneralData.getUserData?.permissions ?? [];
    List<String> permissionEnums = [];
    for (var element in this ?? []) {
      permissionEnums.add(element.value);
    }
    String v = permissions.firstWhere((element) => permissionEnums.contains(element), orElse: () => '');
    if (v.isEmpty) {
      return false;
    }
    return true;
  }

  bool _hasProjectPermission() {
    List<String?> permissions = GeneralData.getUserData?.projectPermissions.map((e) => e.permission).toList() ?? [];
    List<String> permissionEnums = [];
    for (var element in this ?? []) {
      permissionEnums.add(element.value);
    }
    String? v = permissions.firstWhere((element) => permissionEnums.contains(element), orElse: () => '');
    if (v.isNullOrEmpty()) {
      return false;
    }
    return true;
  }

  bool hasAnyPermission() => this._hasPermission() || this._hasProjectPermission();
}
