import 'package:bmi/providers/all_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slide extends StatefulWidget {
  int min, max, dfault, divs;
  String tp;

  Slide({
    Key? key,
    required this.min,
    required this.max,
    required this.dfault,
    required this.divs,
    required this.tp,
  }) : super(key: key);

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AllData>(context, listen: false);
    return Slider(
        max: widget.max.toDouble(),
        min: widget.min.toDouble(),
        divisions: widget.divs,
        value: widget.dfault.toDouble(),
        onChanged: (double newValue) {
          setState(() {
            widget.dfault = newValue.round();
            if(widget.tp=="w"){
              data.setWeight(widget.dfault.toDouble());
            }
            else{
              data.setHeight(widget.dfault.toDouble());
            }
          });
        });
  }
}
