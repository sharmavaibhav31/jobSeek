import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/WelcomeScreen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/forgot_password_screen.dart'; // Import Forgot Password Screen
import 'screens/home_screen.dart';
import 'screens/job_listings_screen.dart';
import 'screens/reset_password_screen.dart'; // Fixed missing semicolon
import 'screens/notification_screen.dart'; // Import Notification Screen

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
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/reset-password': (context) => ResetPasswordScreen(), // Added Reset Password Route
        '/home': (context) => HomeScreen(),
        '/jobs': (context) => const JobListingsScreen(),
        '/notifications': (context) => const NotificationScreen(), // Added Notification Screen Route
      },
    );
  }
}