import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/services/service_route.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'core/services/service_json_mapper_context.dart';
import '../provider_setup.dart';
import 'core/resources/_r.dart';
import 'core/services/service_notification.dart';
import 'core/settings/controller_language.dart';
import 'firebase_options.dart';
import 'main.reflectable.dart';
import 'core/utils/general_data.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      FlavorConfig(
        name: Flavor.PROD.value,
        color: R.color.primary,
        location: BannerLocation.topEnd,
        variables: {
          'baseUrl': 'https://api-languagex.definexlabs.com/api/',
          'fileUrl': 'https://api-languagex.definexlabs.com/',
        },
      );

      initializeReflectable();
      ServiceJsonMapperContext();

      WidgetsFlutterBinding.ensureInitialized();
      // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      await Hive.initFlutter();
      GeneralData.getInstance().hive = await Hive.openBox('languagex');

      await LanguageController.initialize();
      // await ServiceNotification.configure();

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

      runApp(const LanguagexApp());
    },
    (error, stack) =>{}
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}

class LanguagexApp extends StatelessWidget with BaseView {
  const LanguagexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Builder(builder: (context) {
        router(context);
        return MaterialApp.router(
          theme: ThemeData(
            fontFamily: R.fonts.interRegular,
            primarySwatch: R.color.primary,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          supportedLocales: LanguageController.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routerDelegate: ServiceRoute.routerDelegate,
          routeInformationProvider: ServiceRoute.rootRouter.routeInfoProvider(),
          routeInformationParser: ServiceRoute.rootRouter.defaultRouteParser(),
          builder: (_, router) => router!,
        );
      }),
    );
  }
}
