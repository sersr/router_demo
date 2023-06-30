import 'package:demo/_routes/route.dart';
import 'package:demo/modules/status.dart';
import 'package:flutter/material.dart';
import 'package:nop/nop.dart';

void main() {
  // goRouterApp();
  routerApp();
}

void goRouterApp() {
  isNRouter = false;
  Router;
  WidgetsFlutterBinding.ensureInitialized();
  final String platformDefault =
      WidgetsBinding.instance.platformDispatcher.defaultRouteName;
  Log.w('path: $platformDefault');
  final app = MaterialApp.router(
    routerConfig: goRouter,
    restorationScopeId: 'router',
    title: 'go router demo',
  );

  runApp(app);
}

void routerApp() {
  isNRouter = true;

  // SystemNavigator.routeInformationUpdated(uri: Uri.parse('/'), replace: true);
  // NavRoutes.detail(message: 'hello', groupId: null).goReplacement(null);
  Routes.init();

  final reg = RegExp(r'\((package:)(.+?)/(.*)');
  Log.logPathFn = (path) {
    final newPath = path.replaceFirstMapped(reg, (match) {
      final package = match[2];
      if (package == 'demo') {
        return '(./lib/${match[3]}';
      }

      return '';
    });
    if (newPath.isEmpty) {
      return null;
    }
    return newPath;
  };

  final entry = MaterialApp(
    restorationScopeId: 'router',
    theme: ThemeData.light().copyWith(
      platform: TargetPlatform.iOS,
    ),
    builder: (context, child) {
      return router.build(context);
    },
    title: 'router demo',
  );
  // final entry = MaterialApp.router(routerConfig: goRouter);

  runApp(entry);
}
