import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nop/router.dart';
import 'package:nop/nop.dart';
import 'package:nop_annotations/nop_annotations.dart';

import '../../../_routes/route.dart';
import 'detail.dart';

class Data implements NRouterJsonTransfrom {
  const Data(this.value);
  final String value;
  factory Data.fromJson(String data) {
    return Data(data);
  }
  factory Data.fromJson2(String data) {
    return Data(data);
  }

  @override
  String toJson() {
    return value;
  }
}

class Detail01Page extends StatefulWidget {
  const Detail01Page(
      {super.key, @Param() required this.message, this.hhh = 0, this.data});
  const Detail01Page.build(
      {super.key,
      required this.message,
      @Param(name: 'newKey') this.hhh = 0,
      @Param.query(fromJson: Data.fromJson2) this.data = const Data('hhhhh')});
  final String message;
  final int? hhh;
  final Data? data;
  @override
  State<Detail01Page> createState() => _Detail01PageState();
}

class _Detail01PageState extends State<Detail01Page> {
  @override
  Widget build(BuildContext context) {
    final child = Scaffold(
      appBar: AppBar(
        title: Text("detail01: ${widget.message}"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(height: 20),
            Text('${widget.data?.value} | ${widget.hhh} | ${widget.message}'),
            Container(height: 30),
            btn(text: 'back', onTap: () => router.pop()),
            btn(
                text: 'demo',
                onTap: () {
                  final groupId = RouteQueueEntry.of(context)?.groupId;

                  final entry =
                      NavRoutes.detail02(message: 'demo', groupId: groupId)
                          // .goReplacement(result: '....');
                          .goUntil((e) => e.nPage == Routes.home);
                  entry.future.then((value) {
                    Log.w('value: $value', onlyDebug: false);
                  });

                  // goRouter.pushReplacement('/detail02');
                }),
            btn(
                text: 'data',
                onTap: () {
                  decodeRestorationData();
                }),
            btn(
              text: 'nav provider',
              onTap: () {
                context.grass<DetailProvider>(group: null).log();
              },
            )
          ],
        ),
      ),
    );

    return WillPopScope(
        child: child,
        onWillPop: () {
          index += 1;
          Log.w('index: $index');
          return SynchronousFuture(index > 3);
        });
  }

  int index = 0;
}

void decodeRestorationData() async {
  final Map<Object?, Object?>? config = await SystemChannels.restoration
      .invokeMethod<Map<Object?, Object?>>('get');
  final data = config?['data'] as Uint8List?;
  if (data == null) {
    Log.e('... null ... ');
    return null;
  }
  final ByteData encoded =
      data.buffer.asByteData(data.offsetInBytes, data.lengthInBytes);
  final d = const StandardMessageCodec().decodeMessage(encoded)
      as Map<Object?, Object?>?;
  Log.e('data: ${d?.logPretty()}', onlyDebug: false, showTag: false);
}
