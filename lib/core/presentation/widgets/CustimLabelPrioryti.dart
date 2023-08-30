import 'package:flutter/material.dart';

class CustomLabelPrioryti extends StatefulWidget {
  final String? label;

  CustomLabelPrioryti({Key? key, this.label}) : super(key: key);

  @override
  _CustomLabelPriorytiState createState() => _CustomLabelPriorytiState();
}

class _CustomLabelPriorytiState extends State<CustomLabelPrioryti> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.redAccent),
      child: Text(widget.label.toString()),
    );
  }
}
