import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schedule_app/eventView/eventView.dart';
import 'package:schedule_app/shared/event.dart';
import 'package:intl/intl.dart';

class EventList extends StatelessWidget {
  final List<Event> eventList;
  final Function removeEvent;
  const EventList(
      {Key? key, required this.eventList, required this.removeEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          final Event event = eventList[index];
          return ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(DateFormat.yMMMd().format(event.dateTime),
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(DateFormat.jm().format(event.dateTime)),
              ],
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(event.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                  Text(event.location),
                ]),
            subtitle: Text(event.description),
            trailing: PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(child: Text('Edit')),
                PopupMenuItem(
                  child: Text('Delete'),
                  onTap: () => removeEvent(index),
                ),
              ],
            ),
            tileColor: index.isOdd ? Colors.grey.shade200 : Colors.white,
            contentPadding: EdgeInsets.all(10),
          );
        });
  }
}
