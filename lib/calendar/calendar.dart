import 'package:flutter/material.dart';
import 'package:schedule_app/eventList/eventList.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:schedule_app/shared/event.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  final List<Event> eventList;
  final Function addEvent;
  final Function removeEvent;
  const Calendar(
      {Key? key,
      required this.eventList,
      required this.addEvent,
      required this.removeEvent})
      : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  List<Event> getEventsOnDate(DateTime day) {
    return widget.eventList.where((event) {
      return DateFormat.yMMMd().format(event.dateTime) ==
          DateFormat.yMMMd().format(day);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 0, 0),
          lastDay: DateTime.utc(2100, 0, 0),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          eventLoader: (DateTime day) => getEventsOnDate(day),
        ),
        Spacer(flex: 1),
        Expanded(
          child: EventList(
              eventList: getEventsOnDate(_selectedDay),
              addEvent: widget.addEvent,
              removeEvent: widget.removeEvent),
          flex: 8,
        )
      ],
    );
  }
}
