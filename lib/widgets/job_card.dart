import 'package:flutter/material.dart';
import '../models/job_model.dart';

class JobCard extends StatelessWidget {
  final Job job;

  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(job.company, style: const TextStyle(fontSize: 16, color: Colors.blue)),
            const SizedBox(height: 4),
            Text(job.location, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text(job.description, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Apply Functionality
              },
              child: const Text("Apply Now"),
            ),
          ],
        ),
      ),
    );
  }
}
