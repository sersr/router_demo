import 'package:demo/_routes/route.dart';
import 'package:demo/modules/detail/pages/page_01.dart';
import 'package:flutter/material.dart';
import 'package:nop/nop.dart';

void main() {
  // final entry = MaterialApp(
  //   title: 'route demo',
  //   onGenerateRoute: (settings) {
  //     return Routes.root.onMatch(settings)?.wrapMaterial;
  //   },
  //   navigatorObservers: [
  //     Nav.observer,
  //   ],
  // );

  // timeDilation = 3;

  WidgetsFlutterBinding.ensureInitialized();
  decodeRestorationData();

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

  final entry = MaterialApp.router(
    restorationScopeId: 'hhhxxh',
    routerConfig: router,
    // builder: (context, child) {
    //   return router.build(context);
    // },
    title: 'router demo',
  );
  // final entry = MaterialApp.router(routerConfig: goRouter);

  runApp(entry);
}
