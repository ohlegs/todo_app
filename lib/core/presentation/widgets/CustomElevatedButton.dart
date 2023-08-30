import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  String label;
  Function? callback;
  EdgeInsets? margin;
  num? paddig;
  double? height;
  double width;
  CustomElevatedButton(
      {Key? key,
      required this.width,
      required this.label,
      this.margin,
      this.height,
      this.paddig,
      this.callback})
      : super(key: key);

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      child: ElevatedButton(
          style: const ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
              backgroundColor: MaterialStatePropertyAll(Color(0xFFfee4c1))),
          onPressed: () {
            widget.callback!();
          },
          child: Text(
            widget.label,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          )),
    );
  }
}
