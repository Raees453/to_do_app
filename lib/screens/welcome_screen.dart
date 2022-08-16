import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = '/welcome-screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Center(
              child: Text(
                'Welcome to To-Do List',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 80),
            _getListTile(
              Icons.calendar_today,
              'Create tasks fast and easily',
              'Input Tasks, sub-tasks and repeating tasks',
            ),
            const SizedBox(height: 30),
            _getListTile(
              Icons.timelapse,
              'Task Reminders',
              'Set Reminders and never forget anything',
            ),
            const SizedBox(height: 30),
            _getListTile(
              Icons.grid_view_outlined,
              'Personalised Widgets',
              'Create widgets and view your tasks more easily.',
            ),
            const SizedBox(height: 30),
            _getListTile(
              Icons.style,
              'Custom Themes',
              'Choose a theme you like and start your wonderful day',
            ),
            const SizedBox(height: 150),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(
                      flex: 7,
                      child: Center(
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
    );
  }
}
