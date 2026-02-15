import 'package:flutter/material.dart';

class DepartmentsScreen extends StatelessWidget {
  const DepartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departments'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Icon(Icons.computer, color: Colors.blue.shade900),
            ),
            title: const Text('Computer Science'),
            subtitle: const Text('Department of Computing Sciences'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/department/detail',
                arguments: {'name': 'Computer Science'},
              ); 
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: Icon(Icons.engineering, color: Colors.orange.shade900),
            ),
            title: const Text('Engineering'),
            subtitle: const Text('School of Engineering'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/department/detail',
                arguments: {'name': 'Engineering'},
              ); 
            },
          ),
          ListTile(
             leading: CircleAvatar(
              backgroundColor: Colors.green.shade100,
              child: Icon(Icons.business, color: Colors.green.shade900),
            ),
            title: const Text('Business Administration'),
            subtitle: const Text('School of Business'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/department/detail',
                arguments: {'name': 'Business Administration'},
              ); 
            },
          ),
          ListTile(
             leading: CircleAvatar(
              backgroundColor: Colors.red.shade100,
              child: Icon(Icons.local_hospital, color: Colors.red.shade900),
            ),
            title: const Text('Nursing and Midwifery'),
            subtitle: const Text('School of Nursing and Midwifery'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/department/detail',
                arguments: {'name': 'Nursing and Midwifery'},
              ); 
            },
          ),
          ListTile(
             leading: CircleAvatar(
              backgroundColor: Colors.purple.shade100,
              child: Icon(Icons.book, color: Colors.purple.shade900),
            ),
            title: const Text('Theology and Missions'),
            subtitle: const Text('School of Theology and Missions'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/department/detail',
                arguments: {'name': 'Theology and Missions'},
              ); 
            },
          ),
          ListTile(
             leading: CircleAvatar(
              backgroundColor: Colors.yellow.shade100,
              child: Icon(Icons.cast_for_education, color: Colors.yellow.shade900),
            ),
            title: const Text('Education'),
            subtitle: const Text('School of Education'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/department/detail',
                arguments: {'name': 'Education'},
              ); 
            },
          ),
        ],
      ),
    );
  }
}
