import 'package:flutter/material.dart';
import 'job_listings_screen.dart'; // Import the Job Listings screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState(); // Revert to _HomeScreenState
}

class _HomeScreenState extends State<HomeScreen> { // Keep the underscore
  int _selectedIndex = 0; // For Bottom Navigation

  // List of screens for bottom navigation
  final List<Widget> _screens = [
    const Center(child: Text("Welcome to Jobizz!", style: TextStyle(fontSize: 18))),
    const JobListingsScreen(),  // Job Listings Page
    const Center(child: Text("Profile Page", style: TextStyle(fontSize: 18))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jobizz"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Handle notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // TODO: Navigate to Profile Screen
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex], // Switches the screen based on index
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
