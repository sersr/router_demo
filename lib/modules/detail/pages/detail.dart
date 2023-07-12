import 'package:demo/modules/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_nop/router.dart';

import '../../../_routes/route.dart';

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
    final child = Scaffold(
      appBar: AppBar(
        title: Text("detail: ${widget.message}"),
      ),
      body: Center(
          child: Column(
        children: [
          btn(
            text: 'back',
            onTap: () {
              if (isNRouter) {
                router.pop();
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  context.grass<DetailProvider>().log();
                });
                return;
              }
              goRouter.pop();
            },
          ),
          btn(
            text: 'go page 01',
            onTap: () {
              if (isNRouter) {
                final id = RouteQueueEntry.of(context)?.groupId;
                NavRoutes.detail01Build(message: 'go page 01', groupId: id)
                    .go();
              }
            },
          ),
          Builder(builder: (context) {
            return btn(
              text: 'nav provider',
              onTap: () {
                context.grass<DetailProvider>().log();
                context.grass<HomeProvider>().homeLog();
              },
            );
          }),
          btn(
            text: 'repalce',
            onTap: () {
              NavRoutes.detail(message: 'repalce', groupId: NPage.newGroupKey)
                  .goReplacement();
            },
          ),
        ],
      )),
    );
    // return child;
    return Green.value(
      value: HomeProvider(),
      child: child,
    );
  }
}

Widget btn({required String text, void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Material(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(3),
      child: InkWell(
        borderRadius: BorderRadius.circular(3),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          child: Text(text),
        ),
      ),
    ),
  );
}
