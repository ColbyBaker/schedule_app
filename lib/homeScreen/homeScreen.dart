import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schedule_app/addEvent/addEvent.dart';
import 'package:schedule_app/calendar/calendar.dart';
import 'package:schedule_app/eventList/eventList.dart';
import 'package:schedule_app/shared/event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> eventList = [];

  addEvent(Event newEvent) {
    setState(() {
      eventList.add(newEvent);
      eventList.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    });
  }

  removeEvent(int index) {
    setState(() {
      eventList.removeAt(index);
    });
  }

  List<BottomNavigationBarItem> navbarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.calendar,
      ),
      label: 'Calendar',
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.list),
      label: 'Events',
    ),
  ];
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        children: [
          Calendar(
            eventList: eventList,
            addEvent: addEvent,
            removeEvent: removeEvent,
          ),
          EventList(
            eventList: eventList,
            addEvent: addEvent,
            removeEvent: removeEvent,
          ),
        ],
        controller: _pageController,
        onPageChanged: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEventScreen(
                    addEvent: addEvent,
                    removeEvent: removeEvent,
                  ),
                ));
          },
          child: Icon(FontAwesomeIcons.plus, color: Colors.white)),
      bottomNavigationBar: BottomNavigationBar(
        items: navbarItems,
        currentIndex: _currentIndex,
        onTap: (int index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
