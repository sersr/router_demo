import 'package:demo/_routes/route.dart';
import 'package:demo/modules/singleton/providers/singleton_provider.dart';
import 'package:flutter/material.dart';
import 'package:nop/nop.dart';

import 'modules/detail/providers/detail_provider.dart';
import 'modules/home/providers/home_provider.dart';

void main() {
  Log.logPathFn = (path) => path;

  routerApp();
}

void routerApp() {
  Routes.init();
  router.put(() => DetailProvider());
  router.put(() => HomeProvider());
  router.put(() => DetailOuter.outer);
  router.put(() => SingletonProvider.singleton);
  // global

  router.global<DetailProvider>();

  final entry = MaterialApp.router(
    restorationScopeId: 'router',
    theme: ThemeData.light().copyWith(
      platform: TargetPlatform.iOS,
    ),
    routerConfig: router,
    title: 'router demo',
  );

  runApp(entry);
}
