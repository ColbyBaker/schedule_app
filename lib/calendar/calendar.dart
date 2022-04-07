import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 0, 0),
      lastDay: DateTime.utc(2100, 0, 0),
      focusedDay: DateTime.now(),
    );
  }
}


// DatePickerDialog(
//       initialDate: DateTime.now(),
//       firstDate: DateTime.utc(2010, 0, 0),
//       lastDate: DateTime.utc(2100, 0, 0),
//     );