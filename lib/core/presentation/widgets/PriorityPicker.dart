import 'package:flutter/material.dart';
import 'package:project/core/presentation/Colors.dart';
import 'package:project/core/presentation/widgets/CustomElevatedButton.dart';

class PriorityPicker extends StatefulWidget {
  int? priority;
  int? currentPriority;
  Function? callBack;
  Color color = Colors.white;
  String text;
  EdgeInsets? margin;
   PriorityPicker({super.key,required this.text, required this.priority,required this.callBack, required this.color, this.margin,this.currentPriority});

  @override
  State<PriorityPicker> createState() => _PriorityPickerState();
}

class _PriorityPickerState extends State<PriorityPicker> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      margin: widget.margin,
      child: ElevatedButton(

          style: ButtonStyle(


            backgroundColor: MaterialStateProperty.all<Color>(widget.priority == widget.currentPriority ? widget.color : AppColors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(

              RoundedRectangleBorder(

                side: BorderSide(
                  color: widget.color
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            _setPriority(widget.priority);
          }, child: Text(
          style:  TextStyle(
            color: widget.priority == widget.currentPriority ? AppColors.white : widget.color
          ),
          widget.text)),
    );
  }
  _setPriority(selectedPriority){

    widget.callBack!(widget.priority);
  }
}
