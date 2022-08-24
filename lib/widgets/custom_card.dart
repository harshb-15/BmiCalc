import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  List<Widget> lst;

  CustomCard({Key? key, required this.lst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: lst,
      ),
    );
  }
}
