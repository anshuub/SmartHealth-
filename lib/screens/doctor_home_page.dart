import 'package:flutter/material.dart';
import 'package:harry/screens/appoinment_booked_page.dart';
import 'package:harry/screens/set_schedule_page.dart'; // Import the set schedule page

class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Home Page'),
        backgroundColor: Colors.teal, // More professional app bar color
        elevation: 5.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.white], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              const Text(
                'Welcome Doctor!',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 20.0),

              // Description
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Manage your appointments and set your schedule with ease.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 40.0),

              // Appointments Button
              _buildButton(
                context,
                label: 'Appointments',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppointmentBookedPage(),
                    ),
                  );
                },
                color: Colors.blue,
              ),
              const SizedBox(height: 20.0),

              // Set Schedule Button
              _buildButton(
                context,
                label: 'Set Schedule',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SetSchedulePage(),
                    ),
                  );
                },
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create stylish buttons
  Widget _buildButton(BuildContext context, {
    required String label,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Corrected from 'primary' to 'backgroundColor'
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        elevation: 5.0, // Add shadow for a floating effect
        shadowColor: color.withOpacity(0.5), // Subtle shadow effect
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
