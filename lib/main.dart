import 'package:demo/_routes/route.dart';
import 'package:demo/modules/status.dart';
import 'package:flutter/material.dart';
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

  Routes.init();
  router.put(() => DetailProvider());
  router.put(() => HomeProvider());
  router.put(() => DetailOuter.outer);
  // global

  router.global<DetailProvider>();

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
