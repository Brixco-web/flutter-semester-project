import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            "Technical Skills",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Languages", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: const [
                Chip(label: Text("HTML")),
                Chip(label: Text("Python")),
                Chip(label: Text("PHP")),
                Chip(label: Text("C++")),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Frameworks", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: const [
                Chip(label: Text("Flutter")),
                Chip(label: Text("Bootstrap")),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Tools", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: const [
                Chip(label: Text("Git")),
                Chip(label: Text("XAMPP")),
                Chip(label: Text("MySQL")),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
