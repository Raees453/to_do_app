import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String formatTime(DateTime date) {
    return DateFormat.Hm().format(date);
  }

  static String formatDate(DateTime date) {
    return DateFormat.yMd().format(date);
    // return DateFormat.Hm().format(date);
  }

  static int convertToTimeStamp(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  static DateTime convertToDateTime(int timeStamp) {
    return DateTime.fromMillisecondsSinceEpoch(timeStamp);
  }

  static onFeedbackPressed() async {
    final url =
        'mailto:raeesali453@gmail.com?subject=${Uri.encodeFull('To-Do App Feedback')}&body=${Uri.encodeFull('Type in your message here...')}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('Cant Open');
    }
  }
}
