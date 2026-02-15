import 'package:flutter/material.dart';


class FacultyScreen extends StatelessWidget {
  const FacultyScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Directory'),
      ),
      body: ListView(
        children: [
          _buildFacultyCard(
            'Dr. Sarah Johnson',
            'Dean, School of Nursing',
            'Nursing and Midwifery',
            Icons.local_hospital,
          ),
          _buildFacultyCard(
            'Prof. Prince Owusu',
            'HOD, Computer Science',
            'Computer Science',
            Icons.computer,
          ),
           _buildFacultyCard(
            'Madam. Olivia Ansah',
            'Senior Lecturer',
            'Business Administration',
            Icons.business,
          ),
          _buildFacultyCard(
            'Rev. Dr. Kwame Mensah',
            'Chaplain',
            'Theology and Missions',
            Icons.book,
          ),
          _buildFacultyCard(
            'Mr. James Koomson',
            'Lecturer',
            'Engineering',
            Icons.engineering,
          ),
           _buildFacultyCard(
            'Mrs. Elizabeth Tetteh',
            'Coordinator',
            'Education',
            Icons.cast_for_education,
          ),
        ],
      ),
    );
  }

  Widget _buildFacultyCard(String name, String role, String dept, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Icon(icon, color: Colors.blue.shade900),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(role, style: const TextStyle(color: Colors.black87)),
            Text(dept, style: const TextStyle(fontSize: 12)),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.email_outlined),
          onPressed: () {
            // Mock email action
          },
        ),
      ),
    );
  }
}
