import 'package:demo/_routes/route.dart';
import 'package:demo/modules/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nop/flutter_nop.dart';
import 'package:flutter_nop/router.dart';
import 'package:nop/nop.dart';
import 'package:nop_annotations/annotation/router.dart';

import '../../detail/pages/detail.dart';
import '../../detail/pages/page_01.dart';

class HomePage extends StatefulWidget {
  const HomePage({@Param.query(name: 'key') super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with RestorationMixin, RouteQueueEntryStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
      ),
      body: Center(
        child: Column(
          children: [
            btn(
              text: 'data',
              onTap: () {
                decodeRestorationData();
              },
            ),
            btn(
              text: 'hhh',
              onTap: () {
                Log.w(
                    '${entry?.id} ${RestorationScope.maybeOf(context) == null}');
              },
            ),
            btn(
              text: 'go detailbuild',
              onTap: () {
                final groupId = router.ofEntry(context)?.groupId;
                router.goPage(Routes.detail01Build,
                    params: {'newKey': 1},
                    extra: {
                      'message': 'hello build',
                      'data': 'data',
                    },
                    groupId: groupId);
              },
            ),
            btn(text: 'go detail page', onTap: onTap),
            btn(
              text: 'error test',
              onTap: () {
                router.go('/error/path/test');
              },
            ),
            btn(
              text: 'nav provider',
              onTap: () {
                context.getType<DetailProvider>().log();
              },
            )
          ],
        ),
      ),
    );
  }

  void onTap() {
    if (!isNRouter) {
      goRouter.go('/detail?message=sss');
      return;
    }

    // router.go('/detail',
    //     extra: {'message': 'home hhhh'}, groupId: groupId);
    // final c = router.go(
    //     '/detail/detail01Build/23232?message=hello&data=hhhhaxx',
    //     groupId: groupId);
    final c =
        NavRoutes.detail(message: 'home to detail', groupId: NPage.newGroupKey)
            .go();
    entry = c;

    // goRouter.go('/detail');
  }

  @override
  void whenComplete(RouteQueueEntry entry) {
    Log.w('${entry.path} completed.');
  }

  @override
  String get restorationId => 'home_scope';
}
