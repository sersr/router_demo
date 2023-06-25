import 'package:demo/modules/detail/pages/detail.dart';
import 'package:demo/modules/detail/pages/page_01.dart';
import 'package:demo/modules/detail/pages/page_02.dart';
import 'package:demo/modules/live/pages/live.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nop/flutter_nop.dart';
import 'package:flutter_nop/router.dart';
import 'package:nop/nop.dart';
import 'package:nop_annotations/nop_annotations.dart';

import '../modules/home/pages/home.dart';

part 'route.g.dart';

// @NopRouteMain(
//   main: HomePage,
//   pages: [
//     RouteItem(
//       page: DetailPage,
//     )
//   ],
// )
@RouterMain(
  page: HomePage,
  restorationId: 'hello',
  classToNameReg: 'Page\$',
  redirectFn: redirect,
  private: false,
  pages: [
    RouterPage(
      page: DetailPage,
      groupList: [DetailProvider],
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
    return MaterialIgnorePage(key: entry.pageKey, child: child);
    // return CustomTransitionPage(
    //   child: child,
    //   transitionsBuilder: (BuildContext context, Animation<double> animation,
    //       Animation<double> secondaryAnimation, Widget child) {
    //     return child;
    //   },
    // );
  }

  @RouteBuilderItem(pages: [Detail01Page.build])
  static Widget detailWidgetBuild(BuildContext context, Widget child) {
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

class DetailProvider {}

final router = Routes.router;
