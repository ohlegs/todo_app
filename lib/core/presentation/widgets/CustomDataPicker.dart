import 'package:flutter/material.dart';

class CustomDataPicker extends StatefulWidget {
  String label;
  State? state;
  EdgeInsets? margin;
  num? paddig;
  int? height;
  Function callBack;

  CustomDataPicker({
    Key? key,
    this.height,
    required this.label,
    this.margin,
    this.paddig,
    this.state,
    required this.callBack,
  }) : super(key: key);

  @override
  _CustomDataPickerState createState() => _CustomDataPickerState();
}

class _CustomDataPickerState extends State<CustomDataPicker> {
   DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final initialValue = (selectedDate == null ? widget.label : selectedDate?.day);
    return Container(
      margin: widget.margin,
      width: 150,
      child: TextFormField(
        readOnly: true,
        style: const TextStyle(color: Color(0xFFfee4c1)),
        initialValue: initialValue.toString(),
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

  _showDataPicker() async {
    final DateTime? result = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    widget.callBack(result);
  }
}
