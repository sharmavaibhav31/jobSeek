import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'job_listings_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const JobListingsScreen(),
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
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            _buildAppBar(context), // Pass context to the app bar
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildSectionHeader("Featured Jobs"),
            const SizedBox(height: 8),
            _buildFeaturedJobs(),
            const SizedBox(height: 20),
            _buildSectionHeader("Recommended Jobs"),
            const SizedBox(height: 8),
            _buildRecommendedJobs(),
            const SizedBox(height: 20),
            _buildSectionHeader("Popular Jobs"),
            const SizedBox(height: 8),
            _buildPopularJobs(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back!",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
            Text("John Lucas 👋",
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Navigate to the notification screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen()),
                );
              },
            ),
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Icon(Icons.search, color: Colors.grey.shade600),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search a job or position",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.tune, size: 20, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold
            )
        ),
        Text(
            "See all",
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade600
            )
        ),
      ],
    );
  }

  Widget _buildFeaturedJobs() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFeaturedJobCard(
            title: "Product Designer",
            company: "Google",
            salary: "\$160,00/year",
            location: "California, USA",
            color: const Color(0xFF3B6B9B),
            logo: "G",
            logoBackgroundColor: Colors.white,
            logoTextColor: Colors.red,
            tags: ["Design", "Full-Time", "Junior"],
          ),
          const SizedBox(width: 10),
          _buildFeaturedJobCard(
            title: "Software Engineer",
            company: "Facebook",
            salary: "\$180,00/year",
            location: "California, USA",
            color: const Color(0xFF4A7DCB),
            logo: "f",
            logoBackgroundColor: Colors.white,
            logoTextColor: Colors.blue,
            tags: ["IT", "Full-Time", "Junior"],
          ),
          const SizedBox(width: 10),
          _buildFeaturedJobCard(
            title: "UI/UX Designer",
            company: "Intel",
            salary: "\$100,00/year",
            location: "California, USA",
            color: const Color(0xFF172A46),
            logo: "i",
            logoBackgroundColor: Colors.white,
            logoTextColor: const Color(0xFF0071C5),
            tags: ["Design", "Full-Time", "Junior"],
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedJobs() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildSmallJobCard(
                title: "UX Designer",
                company: "Dribbble",
                salary: "\$80,00/y",
                logo: "D",
                logoBackgroundColor: Colors.white,
                logoTextColor: Colors.pink,
                backgroundColor: const Color(0xFFFCEBF1),
                textColor: Colors.black87,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildSmallJobCard(
                title: "Sr Engineer",
                company: "Facebook",
                salary: "\$96,00/y",
                logo: "f",
                logoBackgroundColor: Colors.white,
                logoTextColor: Colors.blue,
                backgroundColor: const Color(0xFFEBF1FC),
                textColor: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildSmallJobCard(
                title: "Jr Executive",
                company: "Burger King",
                salary: "\$96,00/y",
                logo: "BK",
                logoBackgroundColor: Colors.white,
                logoTextColor: Colors.orange,
                backgroundColor: const Color(0xFFFFF9E5),
                textColor: Colors.black87,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildSmallJobCard(
                title: "Product Manager",
                company: "Beats",
                salary: "\$84,00/y",
                logo: "b",
                logoBackgroundColor: Colors.white,
                logoTextColor: Colors.red,
                backgroundColor: const Color(0xFFFFECEC),
                textColor: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPopularJobs() {
    return Column(
      children: [
        _buildSmallJobCard(
          title: "Data Scientist",
          company: "LinkedIn",
          salary: "\$120,00/y",
          logo: "L",
          logoBackgroundColor: Colors.white,
          logoTextColor: Colors.blue,
          backgroundColor: const Color(0xFFE0F7FA),
          textColor: Colors.black87,
        ),
        const SizedBox(height: 10),
        _buildSmallJobCard(
          title: "Marketing Specialist",
          company: "Amazon",
          salary: "\$90,00/y",
          logo: "A",
          logoBackgroundColor: Colors.white,
          logoTextColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          textColor: Colors.black87,
        ),
        const SizedBox(height: 10),
        _buildSmallJobCard(
          title: "Project Coordinator",
          company: "Microsoft",
          salary: "\$85,00/y",
          logo: "M",
          logoBackgroundColor: Colors.white,
          logoTextColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          textColor: Colors.black87,
        ),
        const SizedBox(height: 10),
        _buildSmallJobCard(
          title: "Embedded Systems Engineer",
          company: "Qualcomm",
          salary: "\$90,00/y",
          logo: "Q",
          logoBackgroundColor: Colors.white,
          logoTextColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          textColor: Colors.black87,
        ),
        const SizedBox(height: 10),
        _buildSmallJobCard(
          title: "Senior iOS Developer",
          company: "Apple",
          salary: "\$120,000/y",
          logo: "A",
          logoBackgroundColor: Colors.black,
          logoTextColor: Colors.white,
          backgroundColor: const Color(0xFFECEFF1),
          textColor: Colors.black87,
        ),
        const SizedBox(height: 10),
        _buildSmallJobCard(
          title: "Cloud Solutions Architect",
          company: "Microsoft",
          salary: "\$135,000/y",
          logo: "M",
          logoBackgroundColor: Colors.blue,
          logoTextColor: Colors.white,
          backgroundColor: const Color(0xFFE3F2FD),
          textColor: Colors.black87,
        ),
        const SizedBox(height: 10),
        _buildSmallJobCard(
          title: "Data Science Engineer",
          company: "Netflix",
          salary: "\$140,000/y",
          logo: "N",
          logoBackgroundColor: Colors.red,
          logoTextColor: Colors.white,
          backgroundColor: const Color(0xFFFFEBEE),
          textColor: Colors.black87,
        ),
        const SizedBox(height: 10),
        _buildSmallJobCard(
          title: "Machine Learning Specialist",
          company: "Google",
          salary: "\$150,000/y",
          logo: "G",
          logoBackgroundColor: Colors.white,
          logoTextColor: Colors.blue,
          backgroundColor: const Color(0xFFF3E5F5),
          textColor: Colors.black87,
        ),
        const SizedBox(height: 10),
        _buildSmallJobCard(
          title: "Frontend Developer",
          company: "Facebook",
          salary: "\$110,000/y",
          logo: "F",
          logoBackgroundColor: Colors.blue.shade900,
          logoTextColor: Colors.white,
          backgroundColor: const Color(0xFFE8EAF6),
          textColor: Colors.black87,
        ),
      ],
    );
  }

  Widget _buildFeaturedJobCard({
    required String title,
    required String company,
    required String salary,
    required String location,
    required Color color,
    required String logo,
    required Color logoBackgroundColor,
    required Color logoTextColor,
    required List<String> tags,
  }) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row with Logo and Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: logoBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      logo,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: logoTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Title and Company
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        company,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                // Bookmark Icon
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Tags
            Row(
              children: tags.map((tag) => _buildTag(tag)).toList(),
            ),

            const Spacer(),

            // Salary and Location
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  salary,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  location,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallJobCard({
    required String title,
    required String company,
    required String salary,
    required String logo,
    required Color logoBackgroundColor,
    required Color logoTextColor,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: logoBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    logo,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: logoTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    Text(
                      company,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: textColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            salary,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: textColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}