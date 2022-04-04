import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.calendar,
          ),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.list),
          label: 'Events',
        ),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/calendar');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/event-list');
            break;
        }
      },
    );
  }
}
