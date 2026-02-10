import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Academic History",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 10),
        
        ...PortfolioData.educationHistory.map((edu) => Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const Icon(Icons.school, color: Colors.blue),
                  const SizedBox(height: 5),
                  Text(edu.institution, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(edu.level),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const Icon(Icons.book, color: Colors.blue),
                  const SizedBox(height: 5),
                  const Text("Relevant Courses", style: TextStyle(fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      edu.relevantCourses,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        )).toList(),

        const SizedBox(height: 20),
      ],
    );
  }
}
