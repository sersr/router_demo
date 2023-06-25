import 'package:demo/_routes/route.dart';
import 'package:flutter/material.dart';
import 'package:nop_annotations/annotation/router.dart';

import '../../detail/pages/detail.dart';
import '../../detail/pages/page_01.dart';

class HomePage extends StatefulWidget {
  const HomePage({@Param.query(name: 'key') super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello world"),
      ),
      body: Center(
        child: Column(
          children: [
            btn(
                text: 'data',
                onTap: () {
                  decodeRestorationData();
                }),
            Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(3),
              child: InkWell(
                borderRadius: BorderRadius.circular(3),
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                    child: const Text('go detail page')),
                onTap: () {
                  final groupId = router.ofEntry(context)?.groupId;
                  // router.go('/detail',
                  //     extra: {'message': 'home hhhh'}, groupId: groupId);
                  router.go('/detail/detail01Build/hellodddd?message=hello',
                      groupId: groupId);
                  // NavRoutes.detail(message: 'home to detail', groupId: groupId)
                  //     .go();

                  // goRouter.go('/detail');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
