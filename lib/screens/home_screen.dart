import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/providers/events_provider.dart';
import 'package:provider/provider.dart';

import '../screens/calendar_screen.dart';
import '../screens/mine_screen.dart';
import '../screens/tasks_screen.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedScreen = 1;

  final List screens = const [
    TasksScreen(),
    TasksScreen(),
    CalendarScreen(),
    MineScreen(),
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventsProvider()),
      ],
      builder: (context, __) => Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerWidget(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedScreen,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.view_headline_sharp),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Mine',
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedScreen = index;
              if (selectedScreen == 0) {
                _scaffoldKey.currentState!.openDrawer();
              }
            });
            if (selectedScreen == 0) {
              selectedScreen = 1;
            }
          },
        ),
        body: screens.elementAt(selectedScreen),
      ),
    );
  }
}
