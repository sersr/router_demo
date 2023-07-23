import 'package:demo/_routes/route.dart';
import 'package:demo/modules/singleton/providers/singleton_provider.dart';
import 'package:demo/modules/widgets/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nop/router.dart';

class SingletonTestPage extends StatefulWidget {
  const SingletonTestPage({super.key});

  @override
  State<SingletonTestPage> createState() => _SingletonTestPageState();
}

class _SingletonTestPageState extends State<SingletonTestPage> {
  @override
  Widget build(BuildContext context) {
    context.grass<SingletonProvider>();

    return BasePage(title: 'singleton test', children: [
      button(
        text: 'replacement',
        onTap: () {
          NavRoutes.singletonTest().goReplacement();
        },
      ),
      const Text('---------- log -----------'),
      button(
        text: 'log singleton',
        onTap: () {
          context
              .grass<SingletonProvider>(group: 'current group will be ignored')
              .log();
        },
      )
    ]);
  }
}
