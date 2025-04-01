import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("New Activity"),
              _buildActivityCard(
                logo: "assets/fiverr.png",
                title: "Fiverr wants to take a final interview of you where head of HR will see you!",
                time: "12 min ago",
              ),
              _buildActivityCard(
                logo: "assets/mcdonalds.png",
                title: "Macdonald wants to contact you in 24 hours with proper preparation.",
                time: "47 min ago",
              ),
              const SizedBox(height: 20),
              _buildSectionWithSeeAll("Applications"),
              _buildNotificationItem(
                logo: "assets/bmw.png",
                title: "Your application is submitted successfully to BMW. You can check the status here.",
                time: "1 hr ago",
              ),
              _buildNotificationItem(
                logo: "assets/booking.png",
                title: "Booking.com reviewing your application, cover letter, and portfolio. All the best!",
                time: "3 hrs ago",
              ),
              const SizedBox(height: 20),
              _buildSectionWithSeeAll("Interview"),
              _buildNotificationItem(
                logo: "assets/beats.png",
                title: "Congratulations! Beats liked your resume and want to take an interview of you.",
                time: "4 hrs ago",
              ),
              _buildNotificationItem(
                logo: "assets/behance.png",
                title: "Congratulations! You passed the first round on Behance. Be prepared for the next!",
                time: "6 hrs ago",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionWithSeeAll(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("See all", style: GoogleFonts.poppins(fontSize: 14, color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildActivityCard({required String logo, required String title, required String time}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(logo),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 14)),
                const SizedBox(height: 5),
                Text(time, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({required String logo, required String title, required String time}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(logo),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 14)),
                const SizedBox(height: 5),
                Text(time, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
