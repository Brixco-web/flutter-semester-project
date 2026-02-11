import 'package:flutter_test/flutter_test.dart';
import 'package:week2_portfolio/main.dart';
import 'package:week2_portfolio/models/portfolio_data.dart';

void main() {
  testWidgets('Portfolio name smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the user's name is present on the screen.
    expect(find.text(PortfolioData.name), findsWidgets);
  });
}
