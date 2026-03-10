import 'package:flutter/material.dart';
import 'package:flutter_stepik/tests/async_app/async_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Нажатие кнопки запускает загрузку данных', (tester) async {
    await tester.pumpWidget(AsyncApp());
    await tester.tap(find.text('Загрузить данные'));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text('Данные загружены'), findsOneWidget);
  });
}
