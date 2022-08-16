import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/screens/drawer_screens/donate_screen.dart';
import 'package:flutter_to_do_app/screens/drawer_screens/settings_screen.dart';
import 'package:flutter_to_do_app/screens/drawer_screens/star_tasks_screen.dart';
import 'package:flutter_to_do_app/screens/drawer_screens/theme_screen.dart';

import '../utils/routes.dart';
import '../utils/utils.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'To-Do App',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _createButtonOf(context, Icons.star, 'Star Tasks', () {
                Navigator.of(context).push(
                  Routes.onGenerateRoute(StarTasksScreen.route),
                );
              }),
              _createButtonOf(
                context,
                Icons.grid_view_outlined,
                'Category',
                () {
                  Navigator.of(context).push(
                    Routes.onGenerateRoute(StarTasksScreen.route),
                  );
                },
              ),
              _createButtonOf(
                context,
                Icons.brush,
                'Theme',
                () {
                  Navigator.of(context).push(
                    Routes.onGenerateRoute(ThemeScreen.route),
                  );
                },
              ),
              _createButtonOf(
                context,
                Icons.settings_input_component,
                'Widgets',
                () {
                  // Routes.onGenerateRoute(.route);
                },
              ),
              _createButtonOf(
                context,
                Icons.favorite,
                'Donate',
                () {
                  Navigator.of(context).push(
                    Routes.onGenerateRoute(DonateScreen.route),
                  );
                },
              ),
              _createButtonOf(
                context,
                Icons.feedback,
                'Feedback',
                () => Utils.onFeedbackPressed(),
              ),
              _createButtonOf(
                context,
                Icons.settings,
                'Settings',
                () {
                  Navigator.of(context).push(
                    Routes.onGenerateRoute(SettingsScreen.route),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _createButtonOf(BuildContext context, IconData icon, String text,
      void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
