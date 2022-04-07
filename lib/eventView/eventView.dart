import 'package:flutter/material.dart';
import 'package:schedule_app/shared/event.dart';

class EventView extends StatelessWidget {
  final Event event;
  const EventView({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(event.title),
          ),
        ],
      ),
    );
  }
}
