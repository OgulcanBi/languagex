import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:languagex/core/enums/enum_app.dart';

import 'core/resources/_r.dart';
import 'core/services/service_json_mapper_context.dart';
import 'core/services/service_notification.dart';
import 'core/settings/controller_language.dart';
import 'core/utils/general_data.dart';
import 'firebase_options.dart';
import 'main.dart';
import 'main.reflectable.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

Future<void> main() async {
  FlavorConfig(
    name: Flavor.DEV.value,
    color: R.color.error,
    location: BannerLocation.topStart,
    variables: {
      'baseUrl': 'https://api-testlanguagex.definexlabs.com/api/',
      'fileUrl': 'https://api-testlanguagex.definexlabs.com/',
    },
  );

  initializeReflectable();
  ServiceJsonMapperContext();

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  GeneralData.getInstance().hive = await Hive.openBox('languagex');

  await LanguageController.initialize();
  // ServiceNotification.configure();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: R.color.transparent),
  );

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );

  runApp(const FlavorBanner(child: LanguagexApp()));
}
