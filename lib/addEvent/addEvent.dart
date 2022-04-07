import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  DateTime selectedDate = DateTime.now();
  String location = '';
  String description = '';

  _selectDate(BuildContext context) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.utc(2010, 0, 0),
      lastDate: DateTime.utc(2100, 0, 0),
    );
    if (newDate != null && newDate != selectedDate) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Center(child: Text('${date.month}/${date.day}/${date.year}')),
            Center(child: Text(DateFormat.yMMMd().format(selectedDate))),
            Center(
              child: ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text("Select Date")),
            ),
            Center(child: Text(DateFormat.jm().format(selectedDate))),
          ],
        ),
      ),
    );
  }
}


// DatePickerDialog(
//       initialDate: DateTime.now(),
//       firstDate: DateTime.utc(2010, 0, 0),
//       lastDate: DateTime.utc(2100, 0, 0),
//     );

// _selectDate(BuildContext context) async {
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: selectedDate, // Refer step 1
//     firstDate: DateTime(2000),
//     lastDate: DateTime(2025),
//   );
//   if (picked != null && picked != selectedDate)
//     setState(() {
//       selectedDate = picked;
//     });
// }