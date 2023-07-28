import 'package:demo/modules/widgets/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nop/router.dart';

class RepalcementNewPage extends StatefulWidget {
  const RepalcementNewPage({super.key});

  @override
  State<RepalcementNewPage> createState() => _RepalcementNewPageState();
}

class _RepalcementNewPageState extends State<RepalcementNewPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(title: 'new page', children: [
      button(
        text: 'back',
        onTap: () {
          NRouter.of(context).pop();
        },
      ),
    ]);
  }
}
