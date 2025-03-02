class Job {
  final String title;
  final String company;
  final String location;
  final String description;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.description,
  });
}

// Dummy job list
List<Job> dummyJobs = [
  Job(
    title: "Flutter Developer",
    company: "Tech Corp",
    location: "Remote",
    description: "Looking for a Flutter developer with 2+ years experience.",
  ),
  Job(
    title: "Backend Engineer",
    company: "DataSoft",
    location: "Bangalore",
    description: "Experience with Node.js and MongoDB required.",
  ),
  Job(
    title: "UI/UX Designer",
    company: "Design Pro",
    location: "Mumbai",
    description: "Creative UI/UX designer with knowledge of Figma.",
  ),
];
