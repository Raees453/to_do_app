import 'package:flutter/material.dart';

import '../screens/calendar_screen.dart';
import '../screens/drawer_screens/donate_screen.dart';
import '../screens/drawer_screens/feedback_screen.dart';
import '../screens/drawer_screens/settings_screen.dart';
import '../screens/drawer_screens/star_tasks_screen.dart';
import '../screens/drawer_screens/theme_screen.dart';
import '../screens/home_screen.dart';
import '../screens/mine_screen.dart';
import '../screens/tasks_screen.dart';
import '../screens/welcome_screen.dart';

class Routes {
  static Route onGenerateRoute(String route) {
    switch (route) {
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case DonateScreen.route:
        return MaterialPageRoute(builder: (_) => const DonateScreen());
      case FeedbackScreen.route:
        return MaterialPageRoute(builder: (_) => const FeedbackScreen());
      case SettingsScreen.route:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case StarTasksScreen.route:
        return MaterialPageRoute(builder: (_) => const StarTasksScreen());
      case CalendarScreen.route:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      case MineScreen.route:
        return MaterialPageRoute(builder: (_) => const MineScreen());
      case TasksScreen.route:
        return MaterialPageRoute(builder: (_) => const TasksScreen());
      case WelcomeScreen.route:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case ThemeScreen.route:
        return MaterialPageRoute(builder: (_) => const ThemeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
