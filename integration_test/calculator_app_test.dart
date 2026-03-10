import 'package:flutter/material.dart';
import 'package:flutter_stepik/tests/calculator_app/calculator_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/widget_tests/utils/custom_finder.dart';
import '../test/widget_tests/utils/custom_matcher.dart';

void main() {
  // Инициализация биндингов, необходимых для выполнения
  // интеграционных тестов в Flutter.
  // Он обеспечивает корректную работу виджетов и
  // других компонентов Flutter.
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Calculator screen', () {
    testWidgets('Calculator add button test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));
      await tester.enterText(find.byType(TextField).at(0), '2');
      await tester.enterText(find.byType(TextField).at(1), '3');

      await tester.tap(find.text('+'));

      await tester.pump();

      // проверяем результат
      expect(find.text('Результат: 5'), findsOneWidget);
    });

    testWidgets('Test my finder', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));
      final finder = MyCustomFinder('+');
      expect(finder, findsOneWidget);
    });

    testWidgets('Test winder', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));
      final Finder finder = find.byWidgetPredicate(
        (Widget widget) =>
            widget is ElevatedButton &&
            widget.child is Text &&
            (widget.child as Text).data == '-',
      );
      expect(finder, findsWidgets);
    });

    testWidgets('Test custom matcher', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));
      final findsExactlyoneWidget = FindsExactlyoneWidget();
      final finder = MyCustomFinder('+');
      expect(finder, findsExactlyoneWidget);
    });
  });
}
