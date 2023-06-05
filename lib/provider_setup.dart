import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:languagex/core/services/service_api.dart';
import 'package:languagex/core/utils/general_data.dart';

import 'core/services/service_app.dart';
import 'core/services/service_device_info.dart';
import 'core/services/service_firebase.dart';
import 'core/services/service_route.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => ServiceApp()),
  // ChangeNotifierProvider(create: (context) => ServiceFirebase()),
  ChangeNotifierProvider(create: (context) => ServiceApi(GeneralData.getInstance().getAccessToken(), GeneralData.getInstance().getRefreshToken())),
  ChangeNotifierProvider(create: (context) => ServiceRoute()),
  ChangeNotifierProvider(create: (context) => ServiceDeviceInfo()),
];
