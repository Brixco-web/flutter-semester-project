import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';

class BioSection extends StatelessWidget {
  const BioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "About Me",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              PortfolioData.bio,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
