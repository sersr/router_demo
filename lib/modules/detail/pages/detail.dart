import 'package:demo/modules/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nop/flutter_nop.dart';
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
          btn(
            text: 'nav provider',
            onTap: () {
              context.getType<DetailProvider>(group: null).log();
            },
          )
        ],
      )),
    );
    return Nop.value(
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
