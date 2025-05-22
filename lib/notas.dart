import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NotesPage(),
      ),
    );

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<String> _notes = [];
  final List<String> _reminders = [];
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _reminderController = TextEditingController();

  void _addNote() {
    final text = _noteController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _notes.add(text);
        _noteController.clear();
      });
    }
  }

  void _editNote(int index) {
    _noteController.text = _notes[index];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Editar Nota"),
        content: TextField(
          controller: _noteController,
          decoration: const InputDecoration(hintText: "Digite a nota"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _noteController.clear();
            },
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _notes[index] = _noteController.text.trim();
              });
              _noteController.clear();
              Navigator.pop(context);
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }

  void _addReminder() {
    final text = _reminderController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _reminders.add(text);
        _reminderController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: const Text(
                '📚 Notas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Column(
                        children: [
                          // Campo de Nota
                          FadeInUp(
                            duration: const Duration(milliseconds: 900),
                            child: TextField(
                              controller: _noteController,
                              decoration: InputDecoration(
                                labelText: 'Adicionar anotação',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: _addNote,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Campo de Lembrete
                          FadeInUp(
                            duration: const Duration(milliseconds: 1000),
                            child: TextField(
                              controller: _reminderController,
                              decoration: InputDecoration(
                                labelText: 'Adicionar lembrete',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.alarm_add),
                                  onPressed: _addReminder,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Lista de Notas
                          if (_notes.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '📝 Notas:',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                ..._notes.asMap().entries.map(
                                  (entry) {
                                    int i = entry.key;
                                    String note = entry.value;
                                    return Card(
                                      margin: const EdgeInsets.symmetric(vertical: 8),
                                      child: ListTile(
                                        leading: const Icon(Icons.note),
                                        title: Text(note),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () => _editNote(i),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          const SizedBox(height: 20),
                          // Lista de Lembretes
                          if (_reminders.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '⏰ Lembretes:',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                ..._reminders.map(
                                  (reminder) => Card(
                                    color: Colors.yellow[100],
                                    margin: const EdgeInsets.symmetric(vertical: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.alarm),
                                      title: Text(reminder),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
