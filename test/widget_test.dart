import 'package:flutter/material.dart'; // Garanta que esta linha esteja lá
import 'package:flutter_test/flutter_test.dart';
import 'package:day14/main.dart'; // Esta é a ÚNICA importação para o seu main.dart

void main() {
  testWidgets('Login page displays input fields and button, and navigates on successful login', (WidgetTester tester) async {
    // Monta o widget CodeLabApp como a tela inicial da sua aplicação
    await tester.pumpWidget(const CodeLabApp());

    // Verifica se os campos de texto (TextField) estão presentes
    // Usamos find.bySemanticsLabel para procurar pelos hintTexts que você usa
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.bySemanticsLabel('Matrícula'), findsOneWidget);
    expect(find.bySemanticsLabel('Senha'), findsOneWidget);

    // Verifica se o botão de login (MaterialButton) está presente com o texto correto
    expect(find.widgetWithText(MaterialButton, 'Entrar'), findsOneWidget);

    // Simula entrada de texto nos campos
    await tester.enterText(find.bySemanticsLabel('Matrícula'), 'testuser');
    await tester.enterText(find.bySemanticsLabel('Senha'), 'testpass');

    // Toca no botão de login
    await tester.tap(find.widgetWithText(MaterialButton, 'Entrar'));
    await tester.pumpAndSettle();

    // Verifica se a navegação para MainMenuPage ocorreu após o login
    expect(find.byType(MainMenuPage), findsOneWidget);
    expect(find.byType(LoginPage), findsNothing);
  });

  testWidgets('Login page shows snackbar on empty fields', (WidgetTester tester) async {
    // Monta o widget CodeLabApp
    await tester.pumpWidget(const CodeLabApp());

    // Tenta tocar no botão de login sem preencher os campos
    await tester.tap(find.widgetWithText(MaterialButton, 'Entrar'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // Verifica se o SnackBar com a mensagem de erro está visível
    expect(find.text('Por favor, preencha todos os campos.'), findsOneWidget);
  });
}