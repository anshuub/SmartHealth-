import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhysicalBookingPage extends StatelessWidget {
  const PhysicalBookingPage({super.key});

  // Function to launch phone dialer for physical booking
  Future<void> _callHospital() async {
    const phoneNumber = '1234567890'; // Replace with your hospital's number
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    // Check if the phone URL can be launched
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri); // Launch the phone dialer
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physical Booking'),
        backgroundColor: Colors.teal, // A fresh teal color for the AppBar
        elevation: 10, // Higher elevation for modern appeal
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title with enhanced style
              const Text(
                'Physical Booking',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 20),
              
              // Description text with improved style
              Text(
                'If you prefer to make a physical booking, you can easily call the respective hospital by tapping the button below.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Button styled with modern design and added icon
              ElevatedButton.icon(
                onPressed: _callHospital,
                icon: Icon(Icons.phone_in_talk, color: Colors.white), // Icon for the button
                label: const Text(
                  'Call the Respective Hospital',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Background color
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  elevation: 6, // Subtle shadow effect for modern touch
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 40),

              // Footer text with a lighter style
              Text(
                'For any queries, please contact us during working hours.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
