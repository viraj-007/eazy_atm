import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    final url = Uri.parse('mailto:$toEmail?subject=$subject&body=$body');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      if (kDebugMode) {
        print(url);
      }
    }
  }
}
