class PortfolioData {
  static const String name = "Bright Oppong Adu-Gyamfi";
  static const String profession = "BSc Information Technology";
  static const String email = "joebrixco@gmail.com";
  static const String phone = "+233 532881396";


  static const String bio =
      "I am an IT student who has gained strong interest in mobile and web application development recently. "
      "I look forward in building Flutter apps and learning new technologies in mobile development. ";

  static final List<SkillCategory> skillCategories = [
    SkillCategory(
      title: "Languages",
      skills: ["HTML", "Python", "PHP", "C++"],
    ),
    SkillCategory(
      title: "Frameworks",
      skills: ["Flutter", "Bootstrap"],
    ),
    SkillCategory(
      title: "Tools",
      skills: ["Git", "XAMPP", "MySQL"],
    ),
  ];

  static final List<Education> educationHistory = [
    Education(
      institution: "Valley View University",
      level: "Level 300 • BSc IT",
      relevantCourses: "Database Systems, Web Development, Mobile App Development",
    ),
  ];

  static final List<Project> projects = [
    Project(
      title: "Clinic Booking System",
      description: "Built using HTML, CSS, PHP, JavaScript and XAMPP for managing appointments.",
    ),
    Project(
      title: "Contact Directory",
      description: "A system for storing and managing contacts efficiently.",
    ),
    Project(
      title: "Hello World Flutter App",
      description: "My first Flutter mobile application.",
    ),
  ];
}

class SkillCategory {
  final String title;
  final List<String> skills;

  SkillCategory({required this.title, required this.skills});
}

class Education {
  final String institution;
  final String level;
  final String relevantCourses;

  Education({
    required this.institution,
    required this.level,
    required this.relevantCourses,
  });
}

class Project {
  final String title;
  final String description;

  Project({required this.title, required this.description});
}
