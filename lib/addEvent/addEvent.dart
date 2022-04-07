import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/shared/event.dart';

const List<String> locationOptions = [
  "San Diego",
  "St. George",
  "Dallas",
  "Memphis",
  "Orlando",
  "none"
];
final Iterable<DropdownMenuItem<String>> locationMenuItems =
    locationOptions.map((option) {
  return DropdownMenuItem<String>(child: Text(option), value: option);
});

class AddEventScreen extends StatefulWidget {
  Function(Event event) addEvent;
  AddEventScreen({
    Key? key,
    required this.addEvent,
  }) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  //State variables needed for Event Creation
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now();
  String? _location = null;
  final TextEditingController _descriptionController = TextEditingController();

  _selectDate(BuildContext context) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.utc(2010, 0, 0),
      lastDate: DateTime.utc(2100, 0, 0),
    );
    if (newDate != null && newDate != _selectedDateTime) {
      setState(() {
        _selectedDateTime = newDate;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: _selectedDateTime.hour, minute: _selectedDateTime.minute),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      //Merge new TimeOfDay class with existing DateTime values to create
      // a new DateTime for setState
      final DateTime newDateTime = DateTime(
          _selectedDateTime.year,
          _selectedDateTime.month,
          _selectedDateTime.day,
          newTime.hour,
          newTime.minute);
      setState(() {
        _selectedDateTime = newDateTime;
      });
    }
  }

  var _titleFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Title
              TextFormField(
                key: _titleFormKey,
                controller: _titleController,
                textAlign: TextAlign.center,
                // validator: (String? value) {
                //   if (value == null || value.isEmpty) {
                //     print("happened");
                //     return "Title is required";
                //   } else {
                //     return null;
                //   }
                // },
                decoration: const InputDecoration(
                  labelText: "Title",
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
              //Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(DateFormat.yMMMd().format(_selectedDateTime),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                  ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: const Text("Select Date")),
                ],
              ),
              //Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    DateFormat.jm().format(_selectedDateTime),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  ElevatedButton(
                      onPressed: () => _selectTime(context),
                      child: const Text("Select Time")),
                ],
              ),
              //Location
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Location",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  DropdownButton(
                    items: locationMenuItems.toList(),
                    value: _location,
                    hint: const Text('Select Location'),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _location = newValue;
                        });
                      }
                    },
                  ),
                ],
              ),
              //Description
              TextFormField(
                controller: _descriptionController,
                maxLines: 6,
                decoration: const InputDecoration(
                  labelText: "Description",
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
              //Create Event
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 40),
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.addEvent(Event(
                            title: _titleController.text,
                            dateTime: _selectedDateTime,
                            description: _descriptionController.text,
                          ));
                          Navigator.pop(context);
                          // if (_titleFormKey.currentState.validate()) {
                          //
                          // }
                        },
                        child: const Text("Create Event",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
