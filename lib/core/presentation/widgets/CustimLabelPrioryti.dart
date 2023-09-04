import 'package:flutter/material.dart';
import 'package:project/core/presentation/Colors.dart';

class CustomLabelPrioryti extends StatefulWidget {
  int? prioryti;

  CustomLabelPrioryti({Key? key, required this.prioryti}) : super(key: key);

  @override
  _CustomLabelPriorytiState createState() => _CustomLabelPriorytiState();
}

class _CustomLabelPriorytiState extends State<CustomLabelPrioryti> {
  Color? color;
  String text  = '';

  @override
  void initState() {
    super.initState();
    if (widget.prioryti == 0) {
      setState(() {
        color = Colors.green;
        text = "Low";
      });
    }
    if (widget.prioryti == 1) {
      setState(() {
        color = Colors.amber;
        text = "Normal";
      });
    }
    if (widget.prioryti == 2) {
      setState(() {
        color = Colors.red;
        text = "Hot";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: color),
      child: Text(
          style: const TextStyle(
            fontSize:18,
            color: AppColors.white

          ),
          text!),
    );
  }
}
