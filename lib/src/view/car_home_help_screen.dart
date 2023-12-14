import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCallPage extends StatelessWidget {
  // The phone number you want to call
  final String phoneNumber = '1234567890';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _makePhoneCall(phoneNumber), // Pass context here
          child: Text('Call $phoneNumber'),
        ),
      ),
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  try {
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      debugPrint('Could not launch dialer for $launchUri');
    }
  } catch (e) {
    debugPrint('Error occurred while launching dialer: $e');
  }
}
