import 'package:demo/_routes/route.dart';
import 'package:demo/modules/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nop/flutter_nop.dart';
import 'package:flutter_nop/router.dart';
import 'package:nop/nop.dart';

void main() {
  final reg = RegExp(r'\((package:)(.+?)/(.*)');

  Log.logPathFn = (path) {
    final match = reg.firstMatch(path);
    return switch (match?[2]) {
      == 'hide other package' => false,
      _ => path,
    };
  };

  // goRouterApp();

  routerApp();
}

void goRouterApp() {
  isNRouter = false;
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
  Nav.put(() => DetailProvider());
  Nav.put(() => HomeProvider());
  // global
  Green.of<DetailProvider>(null);

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
