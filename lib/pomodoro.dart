import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PomodoroPage(),
  ));
}

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  static const int tempoInicial = 25 * 60; // 25 minutos
  int tempoRestante = tempoInicial;
  Timer? timer;
  bool estaRodando = false;

  void iniciarTimer() {
    if (estaRodando) return;
    setState(() => estaRodando = true);

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (tempoRestante > 0) {
        setState(() => tempoRestante--);
      } else {
        pararTimer();
        mostrarDialogoConcluido();
      }
    });
  }

  void pausarTimer() {
    timer?.cancel();
    setState(() => estaRodando = false);
  }

  void resetarTimer() {
    pausarTimer();
    setState(() => tempoRestante = tempoInicial);
  }

  void pararTimer() {
    timer?.cancel();
    setState(() => estaRodando = false);
  }

  void mostrarDialogoConcluido() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("⏰ Tempo encerrado!"),
        content: const Text("Hora da pausa ou de começar outro ciclo!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              resetarTimer();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  String formatarTempo(int segundosTotais) {
    final minutos = (segundosTotais ~/ 60).toString().padLeft(2, '0');
    final segundos = (segundosTotais % 60).toString().padLeft(2, '0');
    return "$minutos:$segundos";
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
              child: FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: const Text(
                  "</CodeLab>",
                  style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        "Pomodoro Timer",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: Text(
                        formatarTempo(tempoRestante),
                        style: const TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1400),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          botaoAcao("Iniciar", iniciarTimer),
                          botaoAcao("Pausar", pausarTimer),
                          botaoAcao("Resetar", resetarTimer),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
