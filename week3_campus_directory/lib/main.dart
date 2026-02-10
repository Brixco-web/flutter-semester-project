import 'package:flutter/material.dart';
import 'departments_screen.dart';
import 'faculty_screen.dart';
import 'department_details_screen.dart';

void main() {
  runApp(const CampusDirectoryApp());
}

class CampusDirectoryApp extends StatelessWidget {
  const CampusDirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VVU Campus Directory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/departments': (context) => const DepartmentsScreen(),
        '/faculty': (context) => const FacultyScreen(),
        '/department/detail': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return DepartmentDetailScreen(departmentName: args['name']);
        },
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.school, size: 28),
            SizedBox(width: 10),
            Text(
              'VVU Campus Directory',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello, Student 👋',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome to VVU Directory',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/departments');
              },
              child: const Text('View Departments'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/faculty');
              },
              child: const Text('View Faculty'),
            ),
          ],
        ),
      ),
    );
  }
}
