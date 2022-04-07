import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schedule_app/calendar/calendar.dart';
import 'package:schedule_app/eventList/eventList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        children: const [
          Calendar(),
          EventList(),
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
            Navigator.pushNamed(context, '/add-event');
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
