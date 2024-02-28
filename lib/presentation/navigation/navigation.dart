import 'package:demo_exam/presentation/pages/events_page.dart';
import 'package:demo_exam/presentation/pages/tickets_page.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    void _onItemTap(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    List<Widget> pages = [
      EventsPage(),
      TicketsPage(),
    ];
    return Scaffold(
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter_outlined),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency_recording_sharp),
            label: 'Records',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTap,
      ),
    );
  }
}
