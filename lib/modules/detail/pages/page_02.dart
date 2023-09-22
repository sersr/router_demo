import 'package:flutter/material.dart';

import '../../../_routes/route.dart';
import '../../widgets/page.dart';

class Detail02Page extends StatefulWidget {
  const Detail02Page({super.key, required this.message});
  final String message;
  @override
  State<Detail02Page> createState() => _Detail02PageState();
}

class _Detail02PageState extends State<Detail02Page> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "detail02: ${widget.message}",
      children: [
        button(
          text: 'go home',
          onTap: () {
            /// 使用`Navigator.popUntil`方法
            router.popUntilNav((e) => e.nPage == Routes.home);
          },
        ),
      ],
    );
  }
}
