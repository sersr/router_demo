import 'package:demo/_routes/route.dart';
import 'package:flutter/material.dart';
import 'package:nop_annotations/annotation/router.dart';

class LivePage extends StatefulWidget {
  const LivePage({@Param.query(name: 'key') super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("live page"),
      ),
      body: Center(
        child: Material(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(3),
          child: InkWell(
            borderRadius: BorderRadius.circular(3),
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                child: const Text('go detail page')),
            onTap: () {
              // NavRoutes.detailPage().go;
              router.pop();
            },
          ),
        ),
      ),
    );
  }
}
