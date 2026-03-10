import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';

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
        
        ...PortfolioData.skillCategories.map((category) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(category.title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: category.skills.map((skill) => Chip(label: Text(skill))).toList(),
            ),
            const SizedBox(height: 10),
          ],
        )).toList(),

        const SizedBox(height: 20),
      ],
    );
  }
}
