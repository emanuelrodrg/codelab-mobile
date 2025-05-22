import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:day14/main.dart';

void main() {
  testWidgets('Login page displays input fields and button', (WidgetTester tester) async {
    // Monta o widget
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Verifica se os campos de e-mail e senha estão presentes
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Email or Phone number'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Verifica se o botão de login está presente
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);

    // Simula entrada de texto nos campos
    await tester.enterText(find.byType(TextFormField).at(0), 'usuario@email.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'senha123');

    // Toca no botão de login
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    // Aqui você poderia verificar se algum comportamento esperado acontece após o login
    // Como você apenas imprime no console, não há alteração visível para testar.
  });
}
