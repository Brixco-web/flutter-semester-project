import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/education_section.dart';
import '../widgets/bio_section.dart';
import '../widgets/projects_section.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Bright Oppong Adu-Gyamfi"), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: _portfolioContent(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _portfolioContent() {
    return const [
      HeaderSection(),
      BioSection(),
      SkillsSection(),
      EducationSection(),
      ProjectsSection(),
    ];
  }
}
