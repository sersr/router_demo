import 'package:demo/modules/widgets/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_nop/router.dart';

import '../../../_routes/route.dart';
import '../../home/providers/home_provider.dart';
import '../providers/detail_provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.message});
  final String message;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // context.grass<DetailProvider>(group: null).log();
  }

  @override
  Widget build(BuildContext context) {
    final child = BasePage(
      title: "detail: ${widget.message}",
      children: [
        button(
          text: 'back',
          onTap: () {
            router.pop();
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              context.grass<DetailProvider>().log();
              // Global
              context.grass<DetailProvider>(useEntryGroup: false).log();
            });
            return;
          },
        ),
        button(
          text: 'go detail 01',
          onTap: () {
            final id = RouteQueueEntry.of(context)?.groupId;
            NavRoutes.detail01Build(message: 'go detail 01', groupId: id).go();
          },
        ),
        button(
          text: 'replace',
          onTap: () {
            NavRoutes.detail(message: 'repalce', groupId: NPage.newGroupKey)
                .goReplacement();
          },
        ),
        const Text('---------- log info ----------'),
        Builder(builder: (context) {
          return button(
            text: 'home provider local',
            onTap: () {
              context.grass<HomeProvider>().homeLog();
            },
          );
        }),
        button(
          text: 'detail outer singleton',
          onTap: () {
            context.grass<DetailOuter>().log();

            // create local value
          },
        ),
        button(
          text: 'detail provider group(groupList)',
          onTap: () {
            context.grass<DetailProvider>().log();
            // create local value
          },
        ),
        button(
          text: 'home shared',
          onTap: () {
            context.grass<HomeProvider>().homeLog();
          },
        ),
        button(
          text: 'home group',
          onTap: () {
            context.grass<HomeProvider>(group: context.groupId).homeLog();
          },
        ),
      ],
    );
    // return child;
    return Green(
      create: (_) => HomeProvider(),
      child: child,
    );
  }
}
