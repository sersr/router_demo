import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nop/nop.dart';
import 'package:nop_annotations/nop_annotations.dart';

import '../../../_routes/route.dart';
import 'detail.dart';

class Data {
  const Data(this.value);
  final String value;
  factory Data.fromJson(String data) {
    Log.w('transform: $data');
    return Data(data);
  }
  factory Data.fromJson2(String data) {
    Log.w('transform: $data');
    return Data(data);
  }

  String toJson() {
    return value;
  }
}

class Detail01Page extends StatefulWidget {
  const Detail01Page({super.key, @Param() required this.message});
  const Detail01Page.build(
      {super.key,
      required this.message,
      @Param(name: 'newKey') int hhh = 0,
      @Param.query(fromJson: Data.fromJson2) Data? data = const Data('hhhhh')});
  final String message;
  @override
  State<Detail01Page> createState() => _Detail01PageState();
}

class _Detail01PageState extends State<Detail01Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello world ${widget.message}"),
      ),
      body: Center(
        child: Column(
          children: [
            btn(text: 'back', onTap: () => router.pop()),
            btn(
                text: 'demo',
                onTap: () {
                  final groupId = router.ofEntry(context)?.groupId;

                  final entry =
                      NavRoutes.detail02(message: 'demo', groupId: groupId)
                          .goReplacement('....');
                  // ..goUntil((e) => e.page == Routes.detail01PageBuild);
                  entry.future.then((value) {
                    // developer.postEvent('Flutter.Error', {'data': 'error'});
                    Log.w('value: $value', onlyDebug: false);
                  });

                  // goRouter.pushReplacement('/detail02');
                }),
            btn(
                text: 'data',
                onTap: () {
                  decodeRestorationData();
                })
          ],
        ),
      ),
    );
  }
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
  Log.e('data: $d', onlyDebug: false, showTag: false);
}
