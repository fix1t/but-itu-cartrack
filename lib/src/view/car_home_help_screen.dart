import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCallPage extends StatefulWidget {
  @override
  _HelpCallPageState createState() => _HelpCallPageState();
}

class _HelpCallPageState extends State<HelpCallPage> {
  double _slideValue = 0.0;
  final double _sliderWidth = 250;
  final double _sliderHeight = 100;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Page'),
      ),
      body: Center(
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            // Update the slider value only if the drag is to the right
            if (details.primaryDelta! > 0) {
              double newSlideValue = _slideValue + details.primaryDelta! / _sliderWidth;
              newSlideValue = newSlideValue.clamp(0.0, 1.0);

              setState(() {
                _slideValue = newSlideValue;
              });

              // If the slider reaches the end, make the call
              if (_slideValue == 1.0) {
                _makePhoneCall('1234567890'); // Replace with your phone number
              }
            }
          },
          onHorizontalDragEnd: (details) {
            // Reset the slider when user stops dragging
            setState(() {
              _slideValue = 0.0;
            });
          },
          child: Container(
            height: _sliderHeight,
            width: _sliderWidth,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: _slideValue * _sliderWidth,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: (1 - _slideValue).clamp(0.0, 1.0),
                    child: Text('slide to call'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      debugPrint('Could not launch dialer for $launchUri');
      // Show an error if needed
    }
  }
}
