import 'package:demo/modules/detail/pages/detail.dart';
import 'package:flutter/material.dart';

import '../../../_routes/route.dart';

class Detail02Page extends StatefulWidget {
  const Detail02Page({super.key, required this.message});
  final String message;
  @override
  State<Detail02Page> createState() => _Detail02PageState();
}

class _Detail02PageState extends State<Detail02Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("detail 02 ${widget.message}"),
      ),
      body: Center(
        child: Column(
          children: [
            btn(text: ''),
            btn(
              text: 'back',
              onTap: () {
                router.popUntil((e) => e.page == Routes.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
