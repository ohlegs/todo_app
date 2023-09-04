import 'package:flutter/material.dart';
import 'package:project/core/data/model/Task.dart';
import 'package:project/core/presentation/Colors.dart';
import 'package:project/core/presentation/widgets/CustimLabelPrioryti.dart';
import 'package:project/core/routes/Route.dart';

class ListViewItem extends StatefulWidget {
  Task task;

  ListViewItem({required this.task, Key? key}) : super(key: key);

  @override
  _ListViewItemState createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  bool showRemove = false;

  @override
  Widget build(BuildContext context) {
    print(widget.task.compleet);
    return GestureDetector(
      onTap: () {
        _onTap();
      },
      onLongPress: () {
        _onLongPress();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 10),
        height: 150,
        decoration: const BoxDecoration(
            color: AppColors.item_bg_grey,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            CustomLabelPrioryti(
              key: UniqueKey(),
              prioryti: widget.task.priority,
            ),
            const Spacer(),
            Text(
                style: const TextStyle(color: AppColors.white),
                widget.task.statusCompleet.toString())
          ]),
          Row(
            children: [Text(widget.task.title)],
          ),
          Text(
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.white),
              widget.task.title),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(color: AppColors.text_gray, Icons.schedule_rounded),
              Text(
                  style: const TextStyle(
                      color: AppColors.text_gray,
                      fontWeight: FontWeight.w100,
                      fontSize: 18),
                  ' ${widget.task.dateStart.year}.${widget.task.dateStart.month}.${widget.task.dateStart.day} - ${widget.task.dateEnd.year}.${widget.task.dateEnd.month}.${widget.task.dateEnd.day}')
            ],
          )
        ]),
      ),
    );
  }

  _onTap() {
    Navigator.pushNamed(context, Routes.details, arguments: widget.task);
  }

  _onLongPress() {
    setState(() {
      showRemove = !showRemove;
    });
  }
}
