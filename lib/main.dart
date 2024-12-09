import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:harry/firebase_options.dart';
import 'package:harry/screens/doctor_home_page.dart';
import 'package:harry/screens/doctor_login_page.dart';
import 'package:harry/screens/user_home_page.dart';
import 'package:harry/screens/user_login_page.dart';
import 'package:harry/services/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  tz.initializeTimeZones();
  await NotificationService().initializeNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart_Health',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
      routes: {
        '/doctor_login': (context) => const DoctorLoginPage(),
        '/user_login': (context) => const UserLoginPage(),
        '/doctor_home': (context) => const DoctorHomePage(),
        '/user_home': (context) => const UserHomePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(120.0), // Extended height for AppBar
        child: AppBar(
          title: const Text(
            'Welcome to Smart_Health',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 67, 138, 225),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'A voice-authenticated eHealthCare Solution',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40.0),

                // Add a background image to make the page visually appealing
                // Image.asset(
                //   'assets/images/health_banner.png', // Example image path
                //   height: 200,
                //   width: 300,
                //   fit: BoxFit.cover,
                // ),

                const SizedBox(height: 30.0),

                // Doctor Login Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/doctor_login');
                  },
                  icon:
                      const Icon(Icons.local_hospital, size: 30), // Doctor Icon
                  label: const Text('Doctor Login',
                      style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 8,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
                const SizedBox(height: 20.0),

                // User Login Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/user_login');
                  },
                  icon: const Icon(Icons.person, size: 30), // User Icon
                  label:
                      const Text('User Login', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 8,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Set gradient background for the body
      backgroundColor: Colors.blue.shade50, // Light blue background
    );
  }
}
