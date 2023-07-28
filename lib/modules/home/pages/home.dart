import 'package:demo/_routes/route.dart';
import 'package:demo/modules/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nop/router.dart';
import 'package:nop/nop.dart';
import 'package:nop_annotations/annotation/router.dart';

import '../../detail/pages/page_01.dart';
import '../../detail/providers/detail_provider.dart';
import '../../widgets/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({@Param.query(name: 'key') super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with RestorationMixin, RouteQueueEntryStateMixin {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'home',
      children: [
        button(
          text: 'go detail01.build',
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
        button(text: 'go detail page', onTap: onTap),
        button(
          text: 'error test',
          onTap: () {
            router.go('/error/path/test');
          },
        ),
        button(
          text: 'go singleton test',
          onTap: () {
            NavRoutes.singletonTest().go();
          },
        ),
        button(
          text: 'go replacement',
          onTap: () {
            NavRoutes.replacement().go();
          },
        ),
        const Text('-------- log info ----------'),
        button(
          text: 'log detail provider',
          onTap: () {
            context.grass<DetailProvider>().log();
          },
        ),
        button(
          text: 'data',
          onTap: () {
            decodeRestorationData();
          },
        ),
        button(
          text: 'weak ref',
          onTap: () {
            DetailOuter.outer.log();
          },
        ),
      ],
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
