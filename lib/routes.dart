import 'package:schedule_app/addEvent/addEvent.dart';
import 'package:schedule_app/homeScreen/homeScreen.dart';

var appRoutes = {
  '/': (context) => HomeScreen(),
  '/add-event': (context) => AddEventScreen(),
};
