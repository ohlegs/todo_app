import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String label;
  TextEditingController? controller;
  EdgeInsets? margin;
  num? paddig;
  int? height;

  CustomTextField(
      {Key? key,
      required this.label,
      this.margin,
      this.height,
      this.paddig,
      this.controller})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.height,
        cursorColor: const Color(0xFFfee4c1),
        style: const TextStyle(color: Color(0xFFfee4c1)),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          labelText: widget.label,
          labelStyle: const TextStyle(color: Color(0xFFfee4c1)),
          fillColor: const Color(0xFFfee4c1),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
