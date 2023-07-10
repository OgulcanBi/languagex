import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:languagex/ui/fragments/writting/result/fragment_writting_result.dart';



import '../../ui/views/file_viewer.dart/view_file_viewer.dart';
import '../../ui/views/home/view_home.dart';
import '../../ui/views/splash/view_splash.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(path: '/splash', page: ViewSplash),
    CustomRoute(path: '/home', page: ViewHome, transitionsBuilder: TransitionsBuilders.fadeIn, durationInMilliseconds: 300),
    CustomRoute(path: '/writing/result', page: FragmentWrittingResult, transitionsBuilder: TransitionsBuilders.fadeIn, durationInMilliseconds: 300),
    CustomRoute(path: '/file-viewer/:path', page: ViewFileViewer, transitionsBuilder: TransitionsBuilders.fadeIn),
    RedirectRoute(path: '*', redirectTo: '/splash'),
  ],
)
class $RootRouter {}

class RooterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // log('didPush: ${route.isActive.toString()}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // log('didPop: ${route.isActive.toString()} ${previousRoute!.isActive.toString()}');
  }
}
