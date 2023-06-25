import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("hello world ${widget.message}"),
      ),
      body: Center(
          child: Column(
        children: [
          btn(text: 'back', onTap: () => router.pop()),
          btn(
            text: 'go page 01',
            onTap: () => NavRoutes.detail01Build(
                    message: 'go page 01', groupId: NPage.newGroupKey)
                .go(),
          ),
        ],
      )),
    );
  }
}

Widget btn({required String text, void Function()? onTap}) {
  return Material(
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
  );
}
