import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/forgot_password_screen.dart'; // Import Forgot Password Screen
import 'screens/home_screen.dart';
import 'screens/job_listings_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobSeek',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Start with Login Screen
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(), // Added this
        '/home': (context) => HomeScreen(),  // Added Home Screen Route
        '/jobs': (context) => const JobListingsScreen(),  // Added Job Listings route
      },
    );
  }
}
