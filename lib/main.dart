// ignore_for_file: prefer_const_constructors
import 'package:bmi/providers/all_data.dart';
import 'package:bmi/widgets/custom_card.dart';

import 'package:bmi/widgets/slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AllData(),
      child: MaterialApp(
        title: '',
        home: MyHomePage(title: 'BMI CALCULATOR'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final dt = Provider.of<AllData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Column(
        children: [
          CustomCard(
            lst: [
              Consumer<AllData>(
                builder: (ctx, data, child) => Text(
                  "Weight: ${data.weight}",
                ),
              ),
              Slide(
                min: 0,
                max: 150,
                dfault: 75,
                divs: 150,
                tp: "w",
              ),
            ],
          ),
          CustomCard(
            lst: [
              Consumer<AllData>(
                builder: (ctx, data, child) => Text(
                  "Height: ${data.height}",
                ),
              ),
              Slide(
                min: 120,
                max: 220,
                dfault: 170,
                divs: 100,
                tp: "h",
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              dt.calc();
            },
            child: Text("Calculate"),
          ),
          Consumer<AllData>(
            builder: (ctx, data, child) => Text(
              "BMI: ${data.bmi}",
            ),
          ),
        ],
      ),
    );
  }
}
