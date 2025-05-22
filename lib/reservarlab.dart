import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendamento de Laboratório',
      debugShowCheckedModeBanner: false,
      home: const LabBookingPage(),
    );
  }
}

class LabBookingPage extends StatefulWidget {
  const LabBookingPage({super.key});

  @override
  State<LabBookingPage> createState() => _LabBookingPageState();
}

class _LabBookingPageState extends State<LabBookingPage> {
  final _formKey = GlobalKey<FormState>();
  final _professorController = TextEditingController();
  final _turmaController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // Função para selecionar a data
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Função para selecionar o horário
  Future<void> _selectTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  // Função para formatar a data no padrão dd/mm/yyyy
  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  // Função para mostrar o resumo do agendamento
  void _confirmBooking() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, selecione uma data')),
        );
        return;
      }
      if (_selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, selecione um horário')),
        );
        return;
      }

      final dateStr = _formatDate(_selectedDate!);
      final timeStr = _selectedTime!.format(context);

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Agendamento Confirmado'),
          content: Text(
            'Professor: ${_professorController.text}\n'
            'Turma: ${_turmaController.text}\n'
            'Data: $dateStr\n'
            'Horário: $timeStr',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _professorController.dispose();
    _turmaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Laboratório'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _professorController,
                decoration: const InputDecoration(
                  labelText: 'Nome do professor',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o professor' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _turmaController,
                decoration: const InputDecoration(
                  labelText: 'Turma',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe a turma' : null,
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.date_range),
                title: Text(_selectedDate == null
                    ? 'Selecionar data'
                    : _formatDate(_selectedDate!)),
                onTap: _selectDate,
                tileColor: Colors.grey[200],
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: Text(_selectedTime == null
                    ? 'Selecionar horário'
                    : _selectedTime!.format(context)),
                onTap: _selectTime,
                tileColor: Colors.grey[200],
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _confirmBooking,
                icon: const Icon(Icons.check),
                label: const Text('Confirmar Agendamento'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
