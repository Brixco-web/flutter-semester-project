import 'package:flutter/material.dart';


class DepartmentDetailScreen extends StatefulWidget {
  final String departmentName;
  
  const DepartmentDetailScreen({
    super.key,
    required this.departmentName,
  });


  @override
  State<DepartmentDetailScreen> createState() => _DepartmentDetailScreenState();
}


class _DepartmentDetailScreenState extends State<DepartmentDetailScreen> {
  bool _isExpanded = false;
  int _favoriteCount = 0;


  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }


  void _incrementFavorite() {
    setState(() {
      _favoriteCount++;
    });
  }

  // Data for descriptions
  static const Map<String, String> _descriptions = {
    'Computer Science': 'The Computer Science department at Valley View University focuses on software engineering, mobile development, data science, and artificial intelligence. Our faculty are industry experts who provide hands-on training using modern technologies.',
    'Engineering': 'The School of Engineering is dedicated to training students in civil, electrical, and biomedical engineering. We emphasize practical skills and innovation to solve real-world problems.',
    'Business Administration': 'Our Business School offers comprehensive programs in accounting, marketing, banking, and finance. We prepare students for leadership roles in the global business environment.',
    'Nursing and Midwifery': 'The School of Nursing and Midwifery provides top-tier education in healthcare, patient care, and medical ethics, preparing students for professional practice in hospitals and clinics.',
    'Theology and Missions': 'This school focuses on theological studies, biblical interpretation, and missionary work, equipping students for ministry and religious leadership.',
    'Education': 'The School of Education trains future teachers and educational administrators with modern pedagogical skills and a passion for shaping young minds.',
  };

  static const Map<String, String> _subtitles = {
     'Computer Science': 'Department of Computing Sciences',
     'Engineering': 'School of Engineering',
     'Business Administration': 'School of Business',
     'Nursing and Midwifery': 'School of Nursing & Midwifery',
     'Theology and Missions': 'School of Theology & Missions',
     'Education': 'School of Education',
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.departmentName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Department Header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.departmentName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _subtitles[widget.departmentName] ?? 'Department at VVU',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Expandable Description (Stateful Section)
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Department Description'),
                    trailing: Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                    ),
                    onTap: _toggleExpansion,
                  ),
                  if (_isExpanded)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(
                        _descriptions[widget.departmentName] ?? 'Welcome to the ${widget.departmentName} department. Here you will find all information about courses, faculty, and student activities.',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Interactive Counter (Stateful)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Interest Counter',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Favorites: $_favoriteCount',
                      style: const TextStyle(fontSize: 24, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _incrementFavorite,
                      child: const Text('Add to Favorites'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
