import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/main.dart';

void main() {
  testWidgets('BMI Calculator app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BMICalculatorApp());
    await tester.pump();
    // Just verify it renders without crashing
    expect(find.byType(BMICalculatorApp), findsOneWidget);
  });
}
