import 'package:flutter/material.dart';

class CustomDataPicker extends StatefulWidget {
  String label;
  State? state;
  EdgeInsets? margin;
  num? paddig;
  int? height;

  CustomDataPicker(
      {Key? key,
      this.height,
      required this.label,
      this.margin,
      this.paddig,
      this.state})
      : super(key: key);

  @override
  _CustomDataPickerState createState() => _CustomDataPickerState();
}

class _CustomDataPickerState extends State<CustomDataPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: 150,
      child: TextFormField(
        readOnly: true,
        style: const TextStyle(color: Color(0xFFfee4c1)),
        initialValue: widget.label,
        decoration: InputDecoration(
            labelStyle: const TextStyle(color: Color(0xFFfee4c1)),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.white),
            ),
            label: Text(widget.label),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.white),
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            prefixIcon: IconButton(
              onPressed: () {
                _showDataPicker();
              },
              color: const Color(0xFFfee4c1),
              icon: const Icon(Icons.schedule_rounded),
            )),
      ),
    );
  }

  _showDataPicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
  }
}
