import 'package:demo/modules/detail/pages/detail.dart';
import 'package:demo/modules/detail/pages/page_01.dart';
import 'package:demo/modules/detail/pages/page_02.dart';
import 'package:demo/modules/live/pages/live.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nop/flutter_nop.dart';
import 'package:flutter_nop/router.dart';
import 'package:go_router/go_router.dart';
import 'package:nop/nop.dart';
import 'package:nop_annotations/nop_annotations.dart';

import '../modules/home/pages/home.dart';

part 'route.g.dart';

@RouterMain(
  page: HomePage,
  restorationId: 'hello',
  classToNameReg: 'Page\$',
  errorBuilder: errorBuild,
  private: false,
  pages: [
    RouterPage(
      page: DetailPage,
      groupList: [DetailProvider],
      redirectFn: redirect,
      pages: [
        RouterPage(page: Detail01Page.build),
        RouterPage(page: Detail02Page),
        RouterPage(page: fffPage, name: 'fffNewPage')
      ],
      pageBuilder: _Routes.detailBuilder,
    ),
    RouterPage(page: LivePage),
  ],
)
abstract class _Routes {
  static Page detailBuilder(RouteQueueEntry entry, Widget child) {
    return MaterialIgnorePage(
      key: entry.pageKey,
      entry: entry,
      child: child,
    );
  }

  @RouteBuilderItem(pages: [Detail01Page.build])
  static Widget detailWidgetBuild(Widget child) {
    return child;
  }
}

RouteQueueEntry redirect(RouteQueueEntry entry) {
  Log.w('redirect.');
  return entry;
}

Widget fffPage(String hhh, [String m = '']) {
  return Container();
}

class HomeProvider with NopLifeCycle {
  @override
  void nopInit() {
    super.nopInit();
    Log.i('init. $groupId');
  }

  @override
  void nopDispose() {
    super.nopDispose();
    Log.i('dispose.');
  }

  @override
  void onDisposeCancel() {
    super.onDisposeCancel();
    Log.i('cancel.');
  }

  @override
  void onDisposeStart() {
    super.onDisposeStart();
    Log.i('start.');
  }
}

class DetailProvider with NopLifeCycle {
  void log() {
    Log.e('isGlobalData: $isGlobalData |groupId: $groupId');
  }

  @override
  void onDisposeCancel() {
    Log.w('cancel');
    super.onDisposeCancel();
  }

  @override
  void onDisposeStart() {
    Log.w('start.');
    super.onDisposeStart();
  }

  @override
  void nopDispose() {
    Log.w('dispose.');
    super.nopDispose();
  }
}

RouteQueueEntry errorBuild(
    String location, Map params, Map extra, Object? groupId) {
  Log.e('error:\n$location');
  return RouteQueueEntry.error(
      path: location, params: params, groupId: groupId);
}

final router = Routes.router;

final goRouter = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        pageBuilder: (c, state) {
          return MaterialPage(
            child: const HomePage(),
            key: state.pageKey,
          );
        },
        routes: [
          GoRoute(
            path: 'detail',
            pageBuilder: (context, state) {
              final message = state.queryParameters['message'];
              return MaterialPage(
                  child: DetailPage(message: message!), key: state.pageKey);
            },
          )
        ]),
  ],
);
