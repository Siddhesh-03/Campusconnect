import 'package:flutter/material.dart';

class JobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF946B86),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'CampusConnect',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),

              Text(
                'Upload your CV - let employers find you',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),

              Text(
                'Jobs Based on your activity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),

              // Job Listings
              Expanded(
                child: ListView(
                  children: [
                    jobCard(
                      companyName: 'Wipro Limited 3.6',
                      location: 'Hyderabad',
                      role: 'Developer',
                      skills: ['CI/CD', 'Software Troubleshooting', 'Quality Assurance'],
                      logoPath: 'assets/wipro.png',
                    ),
                    jobCard(
                      companyName: 'TCS 4.0',
                      location: 'Pune',
                      role: 'Developer',
                      salary: '\$30k-\$50k [Employer Est.]',
                      skills: ['Kotlin', 'Quarterly Bonus', 'Call Employer'],
                      logoPath: 'assets/tcs.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget jobCard({
    required String companyName,
    required String location,
    required String role,
    String? salary,
    required List<String> skills,
    required String logoPath,
  }) {
    return Card(
      color: Colors.transparent,
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset(logoPath, width: 50, height: 50), // Company Logo
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(companyName,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(role, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(location, style: TextStyle(fontSize: 12, color: Colors.white)),
                  if (salary != null)
                    Text(salary, style: TextStyle(fontSize: 12, color: Colors.white)),
                  Wrap(
                    spacing: 8,
                    children: skills.map((skill) {
                      return Chip(
                        label: Text(skill, style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.grey.shade600,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
