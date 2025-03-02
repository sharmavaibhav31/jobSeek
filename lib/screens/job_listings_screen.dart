import 'package:flutter/material.dart';
import '../models/job_model.dart';
import '../widgets/job_card.dart';

class JobListingsScreen extends StatelessWidget {
  const JobListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Listings")),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: dummyJobs.length,
        itemBuilder: (context, index) {
          return JobCard(job: dummyJobs[index]);
        },
      ),
    );
  }
}
