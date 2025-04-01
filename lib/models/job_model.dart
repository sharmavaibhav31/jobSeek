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
  Job(
    title: "Frontend Developer",
    company: "TechSolutions",
    location: "Bangalore",
    description: "Experienced React developer with 3+ years in building responsive web applications.",
  ),

  Job(
    title: "DevOps Engineer",
    company: "CloudNine Systems",
    location: "Hyderabad",
    description: "DevOps specialist with expertise in AWS, Docker, and CI/CD pipelines.",
  ),

  Job(
    title: "Android Developer",
    company: "MobileFirst",
    location: "Pune",
    description: "Kotlin developer with experience in building and maintaining consumer apps.",
  ),

  Job(
    title: "Data Scientist",
    company: "Analytics Hub",
    location: "Delhi",
    description: "Data scientist with strong background in machine learning and statistical analysis.",
  ),

  Job(
    title: "Full Stack Developer",
    company: "WebWizards",
    location: "Chennai",
    description: "MERN stack developer with experience in building scalable web applications.",
  ),

  Job(
    title: "Product Manager",
    company: "InnoVentures",
    location: "Gurgaon",
    description: "Product manager with expertise in agile methodologies and user-centric design.",
  ),
];
