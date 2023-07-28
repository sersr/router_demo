import 'package:demo/modules/detail/pages/detail.dart';
import 'package:demo/modules/detail/pages/page_01.dart';
import 'package:demo/modules/detail/pages/page_02.dart';
import 'package:demo/modules/live/pages/live.dart';
import 'package:demo/modules/replacement/pages/new_page.dart';
import 'package:demo/modules/replacement/pages/replacement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nop/router.dart';
import 'package:go_router/go_router.dart';
import 'package:nop/nop.dart';
import 'package:nop_annotations/nop_annotations.dart';

import '../modules/detail/providers/detail_provider.dart';
import '../modules/home/pages/home.dart';
import '../modules/singleton/pages/singleton_test_page.dart';

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
    RouterPage(page: SingletonTestPage),
    RouterPage(page: ReplacementPage, pages: [
      RouterPage(page: RepalcementNewPage),
      RouterPage(
        page: RepalcementBottomSheetPage,
        pageBuilder: _Routes.replacementBottomSheetPage,
      ),
    ]),
  ],
)
abstract class _Routes {
  static RouteQueueEntryPage detailBuilder(
      RouteQueueEntry entry, Widget child) {
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

  static RouteQueueEntryPage replacementBottomSheetPage(
      RouteQueueEntry entry, Widget child) {
    return BottomSheetPage(
        entry: entry,
        builder: (settings) {
          return ModalBottomSheetRoute(
            builder: (context) {
              return child;
            },
            settings: settings,
            isScrollControlled: false,
          );
        });
  }
}

RouteQueueEntry redirect(RouteQueueEntry entry) {
  return entry;
}

Widget fffPage(String hhh, [String m = '']) {
  return Container();
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
