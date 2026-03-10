import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          child: Icon(Icons.person, size: 60),
        ),
        const SizedBox(height: 10),
        const Text(
          PortfolioData.name,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Text(PortfolioData.profession),
        const SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 15,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.email, size: 18),
                SizedBox(width: 5),
                Text(PortfolioData.email),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.phone, size: 18),
                SizedBox(width: 5),
                Text(PortfolioData.phone),
              ],
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
