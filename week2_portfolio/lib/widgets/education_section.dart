import 'package:flutter/material.dart';

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
        
        SizedBox(
          width: double.infinity,
          child: Column(
            children: const [
              Icon(Icons.school, color: Colors.blue),
              SizedBox(height: 5),
              Text("Valley View University", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Level 300 • BSc IT"),
              SizedBox(height: 10),
            ],
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: Column(
            children: const [
              Icon(Icons.book, color: Colors.blue),
              SizedBox(height: 5),
              Text("Relevant Courses", style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Database Systems, Web Development, Mobile App Development",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
