import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DOB extends StatefulWidget {
  const DOB({Key? key}) : super(key: key);

  @override
  _DOBState createState() => _DOBState();
}

class _DOBState extends State<DOB> {

  DateTime? date;

  onDateChanged(DateTime newDate) {
    date = newDate;
    setState(() {});
    debugPrint("DOB: $date");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("DOB", style: Theme.of(context).textTheme.headline3,),
        SizedBox(height: 150.0, child: CupertinoDatePicker(initialDateTime: DateTime(2000, 10, 23), onDateTimeChanged: onDateChanged, mode: CupertinoDatePickerMode.date, dateOrder: DatePickerDateOrder.dmy,)),
      ],
    );
  }
}
