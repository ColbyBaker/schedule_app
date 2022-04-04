import 'package:schedule_app/calendar/calendar.dart';
import 'package:schedule_app/eventList/eventList.dart';
import 'package:schedule_app/homeScreen/homeScreen.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/calendar': (context) => const Calendar(),
  '/event-list': (context) => const EventList(),
};
