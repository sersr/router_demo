import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key, required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        children: children,
      ),
    );
  }
}

Widget button({required String text, void Function()? onTap}) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(3),
        child: InkWell(
          borderRadius: BorderRadius.circular(3),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
            child: Text(text),
          ),
        ),
      ),
    ),
  );
}
