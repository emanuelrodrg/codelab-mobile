import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MediaPage(),
  ));
}

class MediaPage extends StatefulWidget {
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  final TextEditingController av1Controller = TextEditingController();
  final TextEditingController av2Controller = TextEditingController();
  final TextEditingController pfController = TextEditingController();

  String resultado = '';
  bool precisaDeFinal = false;

  void calcularMedia() {
    final av1 = double.tryParse(av1Controller.text) ?? 0;
    final av2 = double.tryParse(av2Controller.text) ?? 0;
    final soma = av1 + av2;

    if (soma >= 14) {
      setState(() {
        precisaDeFinal = false;
        resultado = '✅ Aprovado direto com média ${(soma / 2).toStringAsFixed(1)}';
      });
    } else {
      setState(() {
        precisaDeFinal = true;
        resultado = '⚠️ Média insuficiente. Insira a nota da Prova Final.';
      });
    }
  }

  void calcularFinal() {
    final av1 = double.tryParse(av1Controller.text) ?? 0;
    final av2 = double.tryParse(av2Controller.text) ?? 0;
    final pf = double.tryParse(pfController.text) ?? 0;

    final mediaParcial = (av1 + av2) / 2;
    final mediaFinal = (mediaParcial + pf) / 2;

    setState(() {
      if (mediaFinal >= 5) {
        resultado = '✅ Aprovado na Final com média ${mediaFinal.toStringAsFixed(1)}';
      } else {
        resultado = '❌ Reprovado com média ${mediaFinal.toStringAsFixed(1)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade800,
              Colors.blue.shade600,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      "</CodeLab>",
                      style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: const Text(
                      "Cálculo de Média de Notas",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(33, 150, 243, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              campoTexto(av1Controller, "Nota AV1"),
                              campoTexto(av2Controller, "Nota AV2"),
                              if (precisaDeFinal)
                                campoTexto(pfController, "Nota Prova Final"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            botaoAcao("Calcular", calcularMedia),
                            if (precisaDeFinal)
                              botaoAcao("Final", calcularFinal),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        child: Text(
                          resultado,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget campoTexto(TextEditingController controller, String label) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget botaoAcao(String texto, VoidCallback onPressed) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      color: const Color.fromARGB(255, 20, 90, 195),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
