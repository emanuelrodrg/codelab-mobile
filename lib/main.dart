import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() => runApp(const CodeLabApp());

class CodeLabApp extends StatelessWidget {
  const CodeLabApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeLab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue.shade900,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade900,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ===================== LOGIN PAGE =====================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainMenuPage()),
      );
    } else {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, preencha todos os campos.')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade800, Colors.blue.shade600],
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
                      style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: const Text(
                      "Bem-vindo à Plataforma de Programação",
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
                child: SingleChildScrollView(
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
                              _buildTextField(_usernameController, 'Matrícula', Icons.person),
                              _buildTextField(_passwordController, 'Senha', Icons.lock, obscureText: true),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const ForgotPasswordPage()),
                            );
                          },
                          child: const Text(
                            "Esqueceu a senha?",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              )
                            : MaterialButton(
                                onPressed: _login,
                                height: 50,
                                color: const Color.fromARGB(255, 20, 90, 195),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: const Center(
                                  child: Text(
                                    "Entrar",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 50),
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

  Widget _buildTextField(TextEditingController controller, String hintText, IconData icon, {bool obscureText = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.grey),
        ),
      ),
    );
  }
}

// ===================== MENU INICIAL =====================
class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [
      _MenuItem('Aulas', Icons.school, const AulasPage()),
      _MenuItem('Cálculo de Média', Icons.calculate, const MediaPage()),
      _MenuItem('Notas & Lembretes', Icons.note_alt, const NotesPage()),
      _MenuItem('Pomodoro', Icons.timer, const PomodoroPage()),
      _MenuItem('Reserva de Lab.', Icons.event_available, const LabBookingPage()),
      _MenuItem('Acessibilidade', Icons.sign_language, const AccessibilityPage()),
      _MenuItem('Meu Perfil', Icons.person_outline, const ProfilePage()), // Novo item de menu
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade800, Colors.blue.shade600],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: const Text(
                  "</CodeLab>",
                  style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1200),
                child: const Text(
                  "Escolha sua funcionalidade",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                    itemBuilder: (context, i) {
                      final it = items[i];
                      return FadeInUp(
                        duration: Duration(milliseconds: 1400 + i * 100),
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(15),
                          shadowColor: Colors.blue.withOpacity(.3),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () => Navigator.push(
                                context, MaterialPageRoute(builder: (_) => it.page)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                              child: Row(
                                children: [
                                  Icon(it.icon, size: 32, color: Colors.blue.shade800),
                                  const SizedBox(width: 16),
                                  Text(it.label,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade800)),
                                  const Spacer(),
                                  const Icon(Icons.chevron_right, color: Colors.grey),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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

class _MenuItem {
  final String label;
  final IconData icon;
  final Widget page;
  _MenuItem(this.label, this.icon, this.page);
}

// ===================== AULAS (AGORA STATEFUL) =====================

// MODELOS DE DADOS
class Lesson {
  final String id;
  final String title;
  final String content; // Placeholder for lesson content (e.g., video URL, text)
  bool isCompleted;

  Lesson({required this.id, required this.title, required this.content, this.isCompleted = false});
}

class Course {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  List<Lesson> lessons;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.lessons,
  });

  double get progress {
    if (lessons.isEmpty) return 0.0;
    final completedLessons = lessons.where((lesson) => lesson.isCompleted).length;
    return completedLessons / lessons.length;
  }

  bool get isCompleted => progress == 1.0;

  // Método para criar uma cópia mutável (necessário para setState)
  Course copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    List<Lesson>? lessons,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      lessons: lessons ?? this.lessons,
    );
  }
}

// AULAS PAGE
class AulasPage extends StatefulWidget {
  const AulasPage({super.key});

  @override
  State<AulasPage> createState() => _AulasPageState();
}

class _AulasPageState extends State<AulasPage> {
  // Dados simulados dos cursos
  final List<Course> _courses = [
    Course(
      id: 'flutter_adv',
      title: 'Flutter Avançado',
      description: 'Aprenda Flutter em profundidade, do básico ao avançado.',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/5968/5968759.png', // Exemplo de imagem
      lessons: [
        Lesson(id: 'f1', title: 'Introdução ao Widgets', content: 'Conteúdo de Widgets'),
        Lesson(id: 'f2', title: 'Gerenciamento de Estado', content: 'Conteúdo de State Management'),
        Lesson(id: 'f3', title: 'Consumo de API', content: 'Conteúdo de API REST'),
        Lesson(id: 'f4', title: 'Animações no Flutter', content: 'Conteúdo de Animações'),
      ],
    ),
    Course(
      id: 'python_ml',
      title: 'Python para Machine Learning',
      description: 'Explore Machine Learning com Python e suas bibliotecas.',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/5968/5968350.png', // Exemplo de imagem
      lessons: [
        Lesson(id: 'p1', title: 'Fundamentos de Python', content: 'Conteúdo de Python Básico'),
        Lesson(id: 'p2', title: 'Numpy e Pandas', content: 'Conteúdo de Análise de Dados'),
        Lesson(id: 'p3', title: 'Introdução a Scikit-learn', content: 'Conteúdo de ML'),
      ],
    ),
    Course(
      id: 'web_dev',
      title: 'Desenvolvimento Web Essencial',
      description: 'HTML, CSS e JavaScript para construir sites modernos.',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1055/1055186.png', // Exemplo de imagem
      lessons: [
        Lesson(id: 'w1', title: 'HTML: Estrutura da Web', content: 'Conteúdo de HTML'),
        Lesson(id: 'w2', title: 'CSS: Estilizando a Web', content: 'Conteúdo de CSS'),
        Lesson(id: 'w3', title: 'JavaScript: Interatividade', content: 'Conteúdo de JS'),
      ],
    ),
  ];

  // Método para atualizar o progresso de um curso e recarregar a tela
  void _updateCourseProgress(Course updatedCourse) {
    setState(() {
      final index = _courses.indexWhere((c) => c.id == updatedCourse.id);
      if (index != -1) {
        _courses[index] = updatedCourse; // Substitui o curso pelo atualizado
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aulas e Cursos')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade800, Colors.blue.shade600],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  Text('</CodeLab>',
                      style:
                          TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Icon(Icons.school, color: Colors.white, size: 28),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: ListView.builder(
                  itemCount: _courses.length,
                  itemBuilder: (ctx, i) {
                    final course = _courses[i];
                    return FadeInUp(
                      duration: Duration(milliseconds: 1000 + i * 100),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () async {
                            final resultCourse = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CourseDetailPage(course: course),
                              ),
                            );
                            if (resultCourse is Course) {
                              _updateCourseProgress(resultCourse);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Hero(
                                  tag: 'course_image_${course.id}',
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue.shade100,
                                    backgroundImage: NetworkImage(course.imageUrl),
                                    onBackgroundImageError: (exception, stackTrace) {
                                      Image.asset('assets/placeholder.png');
                                    },
                                    child: course.imageUrl.isEmpty ? Icon(Icons.menu_book, size: 30, color: Colors.blue.shade800) : null,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        course.title,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        course.description,
                                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      LinearProgressIndicator(
                                        value: course.progress,
                                        backgroundColor: Colors.grey[300],
                                        color: Colors.green,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${(course.progress * 100).toStringAsFixed(0)}% Concluído',
                                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===================== COURSE DETAIL PAGE =====================
class CourseDetailPage extends StatefulWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late Course _currentCourse;

  @override
  void initState() {
    super.initState();
    _currentCourse = widget.course.copyWith(lessons: widget.course.lessons.map((l) => Lesson(id: l.id, title: l.title, content: l.content, isCompleted: l.isCompleted)).toList());
  }

  void _toggleLessonCompletion(Lesson lesson) {
    setState(() {
      final index = _currentCourse.lessons.indexWhere((l) => l.id == lesson.id);
      if (index != -1) {
        _currentCourse.lessons[index].isCompleted = !_currentCourse.lessons[index].isCompleted;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Curso'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade800, Colors.blue.shade600],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Hero(
                    tag: 'course_image_${_currentCourse.id}',
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blue.shade100,
                      backgroundImage: NetworkImage(_currentCourse.imageUrl),
                      onBackgroundImageError: (exception, stackTrace) {
                        Image.asset('assets/placeholder.png');
                      },
                      child: _currentCourse.imageUrl.isEmpty ? Icon(Icons.menu_book, size: 60, color: Colors.blue.shade800) : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _currentCourse.title,
                    style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currentCourse.description,
                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: _currentCourse.progress,
                    backgroundColor: Colors.grey[300],
                    color: Colors.green,
                    minHeight: 10,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Progresso: ${(_currentCourse.progress * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aulas (${_currentCourse.lessons.where((l) => l.isCompleted).length}/${_currentCourse.lessons.length})',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue.shade800),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _currentCourse.lessons.length,
                        itemBuilder: (context, index) {
                          final lesson = _currentCourse.lessons[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: CheckboxListTile(
                              activeColor: Colors.green,
                              title: Text(
                                lesson.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: lesson.isCompleted ? TextDecoration.lineThrough : null,
                                  color: lesson.isCompleted ? Colors.grey : Colors.black87,
                                ),
                              ),
                              subtitle: Text(
                                lesson.content,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  decoration: lesson.isCompleted ? TextDecoration.lineThrough : null,
                                ),
                              ),
                              value: lesson.isCompleted,
                              onChanged: (bool? newValue) {
                                _toggleLessonCompletion(lesson);
                              },
                              secondary: Icon(
                                lesson.isCompleted ? Icons.check_circle : Icons.circle_outlined,
                                color: lesson.isCompleted ? Colors.green : Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_currentCourse.isCompleted)
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CertificatePage(course: _currentCourse, userName: "Seu Nome Aqui"),
                              ),
                            );
                          },
                          icon: const Icon(Icons.card_membership, color: Colors.white),
                          label: const Text('Emitir Certificado', style: TextStyle(fontSize: 18, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                    Center(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context, _currentCourse);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blue.shade800,
                          side: BorderSide(color: Colors.blue.shade800),
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text('Voltar para Cursos'),
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
}

// ===================== CERTIFICATE PAGE =====================
class CertificatePage extends StatelessWidget {
  final Course course;
  final String userName;

  const CertificatePage({super.key, required this.course, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seu Certificado')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade800, Colors.blue.shade600],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: const Text("Certificado de Conclusão",
                    style:
                        TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1200),
                        child: Icon(Icons.verified_user, size: 100, color: Colors.green.shade700),
                      ),
                      const SizedBox(height: 30),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1300),
                        child: Text(
                          'Este certificado confirma que',
                          style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: Text(
                          userName,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: Text(
                          'concluiu com sucesso o curso',
                          style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        child: Text(
                          course.title,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: Colors.green.shade800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1700),
                        child: Text(
                          'em ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 50),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1800),
                        child: Column(
                          children: [
                            Container(width: 150, height: 1, color: Colors.grey),
                            const Text('Assinatura da Plataforma', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
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
}

// ===================== CÁLCULO DE MÉDIA (ESTILIZADA) =====================
class MediaPage extends StatefulWidget {
  const MediaPage({super.key});
  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  late final TextEditingController av1;
  late final TextEditingController av2;
  late final TextEditingController pf;
  String res = '';
  bool needFinal = false;

  @override
  void initState() {
    super.initState();
    av1 = TextEditingController();
    av2 = TextEditingController();
    pf = TextEditingController();
  }

  @override
  void dispose() {
    av1.dispose();
    av2.dispose();
    pf.dispose();
    super.dispose();
  }

  void calc() {
    final n1 = double.tryParse(av1.text) ?? 0;
    final n2 = double.tryParse(av2.text) ?? 0;
    final sum = n1 + n2;
    if (sum >= 14) {
      setState(() {
        needFinal = false;
        res = '✅ Aprovado com média ${(sum / 2).toStringAsFixed(1)}';
      });
    } else {
      setState(() {
        needFinal = true;
        res = '⚠️ Insira nota da Final';
      });
    }
  }

  void calcFinal() {
    final n1 = double.tryParse(av1.text) ?? 0;
    final n2 = double.tryParse(av2.text) ?? 0;
    final f = double.tryParse(pf.text) ?? 0;
    final mid = (n1 + n2) / 2;
    final mf = (mid + f) / 2;
    setState(() {
      res = mf >= 5
          ? '✅ Aprovado na Final (${mf.toStringAsFixed(1)})'
          : '❌ Reprovado (${mf.toStringAsFixed(1)})';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de Média')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade800, Colors.blue.shade600],
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
                child: const Text("</CodeLab>",
                    style:
                        TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1300),
                child:
                    const Text("Calcule suas notas e média final", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: Column(
                          children: [
                            _buildStyledTextField(av1, 'Nota AV1', Icons.looks_one),
                            const SizedBox(height: 16),
                            _buildStyledTextField(av2, 'Nota AV2', Icons.looks_two),
                            if (needFinal) ...[
                              const SizedBox(height: 16),
                              _buildStyledTextField(pf, 'Nota Final', Icons.school),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStyledButton('Calcular Média', calc, Colors.blue.shade700),
                            if (needFinal)
                              const SizedBox(width: 16), // Espaçamento entre botões
                              _buildStyledButton('Calcular Final', calcFinal, Colors.green.shade700),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        child: Text(
                          res,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: res.startsWith('✅') ? Colors.green.shade800 : (res.startsWith('❌') ? Colors.red.shade800 : Colors.blue.shade800),
                          ),
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

  // Novo helper method para campos de texto estilizados
  Widget _buildStyledTextField(TextEditingController controller, String hintText, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[50],
          prefixIcon: Icon(icon, color: Colors.blue.shade800),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        style: const TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );
  }

  // Novo helper method para botões estilizados
  Widget _buildStyledButton(String text, VoidCallback onPressed, Color color) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        height: 55,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
        highlightElevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// ===================== NOTAS & LEMBRETES =====================
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _notes = ["Estudar Flutter", "Revisar POO", "Comprar material"];
  final _reminders = ["Reunião 10h", "Enviar relatório", "Tomar água"];
  late final TextEditingController nCtrl;
  late final TextEditingController rCtrl;

  @override
  void initState() {
    super.initState();
    nCtrl = TextEditingController();
    rCtrl = TextEditingController();
  }

  @override
  void dispose() {
    nCtrl.dispose();
    rCtrl.dispose();
    super.dispose();
  }

  void addNote() {
    final t = nCtrl.text.trim();
    if (t.isNotEmpty) setState(() { _notes.add(t); nCtrl.clear(); });
  }

  void editNote(int i) {
    nCtrl.text = _notes[i];
    showDialog(context: context, builder: (_) => AlertDialog(
      title: const Text("Editar Nota"),
      content: TextField(controller: nCtrl, decoration: const InputDecoration(hintText: "Digite...")),
      actions: [
        TextButton(onPressed: (){ Navigator.pop(context); nCtrl.clear(); }, child: const Text("Cancelar")),
        ElevatedButton(onPressed: (){ setState((){ _notes[i]=nCtrl.text.trim(); }); nCtrl.clear(); Navigator.pop(context); }, child: const Text("Salvar")),
      ],
    ));
  }

  void addRem() {
    final t = rCtrl.text.trim();
    if (t.isNotEmpty) {
      setState(() {
        _reminders.add(t);
        rCtrl.clear();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notas & Lembretes')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade800, Colors.blue.shade600],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FadeInDown(duration: const Duration(milliseconds: 800), child: const Text('📚 Notas', style: TextStyle(color: Colors.white,fontSize:30,fontWeight:FontWeight.w900))),
            ),
            const SizedBox(height:20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40))),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth:500),
                    child: Column(
                      children: [
                        FadeInUp(duration:const Duration(milliseconds:900),child:TextField(controller:nCtrl,decoration: InputDecoration(labelText:'Adicionar anotação',suffixIcon:IconButton(icon:const Icon(Icons.add), onPressed:addNote)))),
                        const SizedBox(height:20),
                        FadeInUp(duration:const Duration(milliseconds:1000),child:TextField(controller:rCtrl,decoration: InputDecoration(labelText:'Adicionar lembrete',suffixIcon:IconButton(icon:const Icon(Icons.alarm_add),onPressed:addRem)))),
                        const SizedBox(height:30),
                        if(_notes.isNotEmpty)...[
                          const Text('📝 Notas:',style:TextStyle(fontWeight:FontWeight.bold,fontSize:18)),const SizedBox(height:10),
                          ..._notes.asMap().entries.map((e){
                            return Card(margin:const EdgeInsets.symmetric(vertical:8),child:ListTile(
                              leading: const Icon(Icons.note),
                              title: Text(e.value),
                              trailing: IconButton(icon:const Icon(Icons.edit),onPressed:()=>editNote(e.key)),
                            ));
                          }).toList(),
                        ],
                        const SizedBox(height:20),
                        if(_reminders.isNotEmpty)...[
                          const Text('⏰ Lembretes:',style:TextStyle(fontWeight:FontWeight.bold,fontSize:18)),const SizedBox(height:10),
                          ..._reminders.map((r){
                            return Card(color:Colors.yellow[100],margin:const EdgeInsets.symmetric(vertical:8),child:ListTile(
                              leading: const Icon(Icons.alarm),
                              title: Text(r),
                            ));
                          }).toList(),
                        ],
                      ],
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

// ===================== POMODORO =====================
class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});
  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  static const int initial = 25 * 60;
  int remaining = initial;
  Timer? timer;
  bool running = false;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void start() {
    if (running) return;
    setState(() => running = true);
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remaining > 0) setState(() => remaining--);
      else { pause(); doneDialog(); }
    });
  }

  void pause() { timer?.cancel(); setState(()=>running=false); }
  void reset() { pause(); setState(()=>remaining=initial); }

  void doneDialog(){
    showDialog(context: context,builder:(_)=>AlertDialog(
      title:const Text("⏰ Tempo encerrado!"),
      content:const Text("Hora da pausa ou novo ciclo"),
      actions:[TextButton(onPressed:(){ Navigator.pop(context); reset(); }, child:const Text("OK"))],
    ));
  }

  String fmt(int s){
    final m=(s~/60).toString().padLeft(2,'0');
    final se=(s%60).toString().padLeft(2,'0');
    return "$m:$se";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pomodoro')),
      body:Container(
        width:double.infinity,
        decoration:BoxDecoration(gradient:LinearGradient(begin:Alignment.topCenter,colors:[Colors.blue.shade900,Colors.blue.shade800,Colors.blue.shade600])),
        child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
          const SizedBox(height:80),
          Padding(padding:const EdgeInsets.all(20),child:FadeInUp(duration:const Duration(milliseconds:1000),child:const Text("</CodeLab>",style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold)))),
          Expanded(child:Container(
            padding:const EdgeInsets.all(30),
            decoration:const BoxDecoration(color:Colors.white,borderRadius:BorderRadius.only(topLeft:Radius.circular(60),topRight:Radius.circular(60))),
            child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
              FadeInUp(duration:const Duration(milliseconds:1200),child:Text("Pomodoro Timer",style:TextStyle(fontSize:28,fontWeight:FontWeight.bold,color:Colors.blue.shade800))),
              const SizedBox(height:50),
              FadeInUp(duration:const Duration(milliseconds:1300),child:Text(fmt(remaining),style:const TextStyle(fontSize:70,fontWeight:FontWeight.bold,color:Colors.black87))),
              const SizedBox(height:50),
              FadeInUp(duration:const Duration(milliseconds:1400),child:Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:[
                _btn("Iniciar",start),_btn("Pausar",pause),_btn("Resetar",reset)
              ]))
            ])
          ))
        ])
      )
    );
  }

  Widget _btn(String t, VoidCallback cb) =>MaterialButton(onPressed:cb,height:50,color:Colors.blue.shade800,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)),child:Padding(padding:const EdgeInsets.symmetric(horizontal:20),child:Text(t,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.bold))));
}

// ===================== RESERVA DE LABORATÓRIO =====================
class Reservation {
  final String professor, turma, data, horario;
  Reservation({required this.professor, required this.turma, required this.data, required this.horario});
}

class LabBookingPage extends StatefulWidget {
  const LabBookingPage({super.key});
  @override
  State<LabBookingPage> createState()=>_LabBookingPageState();
}

class _LabBookingPageState extends State<LabBookingPage> {
  late final TextEditingController pCtrl;
  late final TextEditingController tCtrl;
  DateTime? date; TimeOfDay? time;
  final _res=[
    Reservation(professor:'Mariane',turma:'3º Semestre',data:'10/10/2025',horario:'08:00'),
    Reservation(professor:'Igor',turma:'3º Semestre',data:'11/10/2025',horario:'10:00'),
  ];

  @override
  void initState() {
    super.initState();
    pCtrl = TextEditingController();
    tCtrl = TextEditingController();
  }

  @override
  void dispose() {
    pCtrl.dispose();
    tCtrl.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    final d = await showDatePicker(
      context:context,
      initialDate: date ?? DateTime.now(),
      firstDate:DateTime.now(),
      lastDate:DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue.shade800,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black87,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.blue.shade800),
            ),
          ),
          child: child!,
        );
      },
    );
    if (d!=null) setState(()=>date=d);
  }

  Future<void> pickTime() async {
    final t = await showTimePicker(
      context:context,
      initialTime:TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue.shade800,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black87,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.blue.shade800),
            ),
          ),
          child: child!,
        );
      },
    );
    if (t!=null) setState(()=>time=t);
  }

  void book(){
    if(pCtrl.text.isEmpty||tCtrl.text.isEmpty||date==null||time==null){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Complete todos os campos')));
      return;
    }
    final r = Reservation(
      professor: pCtrl.text,
      turma: tCtrl.text,
      data: '${date!.day}/${date!.month}/${date!.year}',
      horario: time!.format(context),
    );
    setState(()=>_res.add(r));
    pCtrl.clear(); tCtrl.clear(); date=null; time=null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reserva de Laboratório')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade800, Colors.blue.shade600],
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
                child: const Text("</CodeLab>",
                    style:
                        TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1300),
                child:
                    const Text("Agende seu laboratório", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(children:[
                    FadeInUp(
                      duration: const Duration(milliseconds: 1400),
                      child: _buildTextField(pCtrl, 'Professor', Icons.person),
                    ),
                    const SizedBox(height:16),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: _buildTextField(tCtrl, 'Turma', Icons.group),
                    ),
                    const SizedBox(height:16),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: _buildDateOrTimeListTile(
                        leadingIcon: Icons.date_range,
                        title: date==null?'Selecionar data':'${date!.day}/${date!.month}/${date!.year}',
                        onTap: pickDate,
                      ),
                    ),
                    const SizedBox(height:16),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1700),
                      child: _buildDateOrTimeListTile(
                        leadingIcon: Icons.access_time,
                        title: time==null?'Selecionar horário':time!.format(context),
                        onTap: pickTime,
                      ),
                    ),
                    const SizedBox(height:24),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1800),
                      child: MaterialButton(
                        onPressed: book,
                        height: 50,
                        color: Colors.blue.shade800,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        child: const Center(
                          child: Text(
                            'Confirmar Agendamento',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:24),
                    const Divider(),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1900),
                      child: Text('Reservas Atuais',style:Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.blue.shade800, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height:16),
                    ..._res.asMap().entries.map((entry) {
                      final index = entry.key;
                      final r = entry.value;
                      return FadeInUp(
                        duration: Duration(milliseconds: 2000 + index * 100),
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 4,
                          shadowColor: Colors.blue.withOpacity(.2),
                          child: ListTile(
                            leading:Icon(Icons.event_note,color:Theme.of(context).primaryColor),
                            title:Text('${r.professor} - ${r.turma}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle:Text('Data: ${r.data} • Horário: ${r.horario}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_forever, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _res.removeAt(index);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Reserva removida.')),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.blue.shade800),
        ),
      ),
    );
  }

  Widget _buildDateOrTimeListTile({required IconData leadingIcon, required String title, required VoidCallback onTap}) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      shadowColor: Colors.blue.withOpacity(.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              Icon(leadingIcon, size: 28, color: Colors.blue.shade800),
              const SizedBox(width: 15),
              Text(title, style: const TextStyle(fontSize: 16, color: Colors.black87)),
              const Spacer(),
              const Icon(Icons.edit, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

// ===================== FORGOT PASSWORD PAGE =====================
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
          children: <Widget>[
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: const Text(
                  "Recuperar Senha",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 60),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: const Text(
                          "Digite seu e-mail ou matrícula para recuperar a senha",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: "E-mail ou Matrícula",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        child: ElevatedButton(
                          onPressed: () {
                            final input = _emailController.text.trim();
                            if (input.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Por favor, preencha o campo")),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Link de recuperação enviado para $input")),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Enviar"),
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
}

// ===================== ACESSIBILIDADE =====================
class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acessibilidade')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade800, Colors.blue.shade600],
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1300),
                child: const Text(
                  "Recursos de Acessibilidade",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: Text(
                          'Bem-vindo à seção de acessibilidade. Aqui você encontrará recursos e configurações para melhorar sua experiência no aplicativo.',
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: _buildAccessibilityFeature(
                          icon: Icons.subtitles,
                          title: 'Legendas e Transcrições',
                          description: 'Ative legendas automáticas para conteúdo de vídeo e áudio.',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Funcionalidade de Legendas ativada/desativada.')),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        child: _buildAccessibilityFeature(
                          icon: Icons.vibration,
                          title: 'Feedback Tátil',
                          description: 'Receba feedback vibratório para interações importantes.',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Funcionalidade de Feedback Tátil ativada/desativada.')),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1700),
                        child: _buildAccessibilityFeature(
                          icon: Icons.text_fields,
                          title: 'Tamanho da Fonte',
                          description: 'Ajuste o tamanho do texto para melhor leitura.',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Ajuste de Tamanho da Fonte.')),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1800),
                        child: Center(
                          child: Text(
                            'Estamos sempre trabalhando para melhorar a acessibilidade. Suas sugestões são bem-vindas!',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey.shade600),
                          ),
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

  Widget _buildAccessibilityFeature({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(15),
      shadowColor: Colors.blue.withOpacity(.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 36, color: Colors.blue.shade800),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

// ===================== MEU PERFIL (NOVA TELA) =====================
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Dados simulados do usuário
  final String _userName = "João Silva";
  final String _userEmail = "joao.silva@codelab.com";
  final String _userMatricula = "2023001234";
  final String _userSemestre = "3º Semestre";
  final String _userCourseName = "Ciência da Computação";
  final String _userProfileImageUrl = "https://cdn-icons-png.flaticon.com/512/147/147142.png"; // Imagem de perfil de exemplo

  // Curso de Ciência da Computação (simulado)
  late Course _computerScienceCourse;

  @override
  void initState() {
    super.initState();
    _computerScienceCourse = Course(
      id: 'comp_sci',
      title: _userCourseName,
      description: 'Fundamentos e avanços em Ciência da Computação.',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2920/2920272.png', // Ícone de Ciência da Computação
      lessons: [
        Lesson(id: 'cs1', title: 'Introdução à Programação', content: 'Lógica e algoritmos.'),
        Lesson(id: 'cs2', title: 'Estruturas de Dados', content: 'Listas, árvores, grafos.'),
        Lesson(id: 'cs3', title: 'Sistemas Operacionais', content: 'Conceitos e funcionamento.'),
        Lesson(id: 'cs4', title: 'Redes de Computadores', content: 'Protocolos e arquiteturas.'),
        Lesson(id: 'cs5', title: 'Banco de Dados', content: 'Modelagem e SQL.'),
      ],
    );
    // Marcar algumas aulas como concluídas para simular progresso
    _computerScienceCourse.lessons[0].isCompleted = true;
    _computerScienceCourse.lessons[1].isCompleted = true;
  }

  // Método para atualizar o progresso do curso de Ciência da Computação
  void _updateComputerScienceCourseProgress(Course updatedCourse) {
    setState(() {
      _computerScienceCourse = updatedCourse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade800, Colors.blue.shade600],
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
                child: const Text("Meu Perfil",
                    style:
                        TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1300),
                child:
                    const Text("Informações do Usuário e Progresso", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.blue.shade100,
                          backgroundImage: NetworkImage(_userProfileImageUrl),
                          onBackgroundImageError: (exception, stackTrace) {
                            Image.asset('assets/placeholder_user.png'); // Adicione uma imagem placeholder para o usuário
                          },
                          child: _userProfileImageUrl.isEmpty ? Icon(Icons.person, size: 70, color: Colors.blue.shade800) : null,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: Text(
                          _userName,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900),
                        ),
                      ),
                      const SizedBox(height: 8),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        child: Text(
                          _userEmail,
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildInfoCard(
                        icon: Icons.badge,
                        title: 'Matrícula',
                        value: _userMatricula,
                        delay: 1700,
                      ),
                      const SizedBox(height: 16),
                      _buildInfoCard(
                        icon: Icons.calendar_today,
                        title: 'Semestre',
                        value: _userSemestre,
                        delay: 1800,
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 1900),
                          child: Text(
                            'Meu Curso Principal',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade800),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 4,
                          margin: EdgeInsets.zero,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () async {
                              final resultCourse = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CourseDetailPage(course: _computerScienceCourse),
                                ),
                              );
                              if (resultCourse is Course) {
                                _updateComputerScienceCourseProgress(resultCourse);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Hero(
                                    tag: 'course_image_${_computerScienceCourse.id}',
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.blue.shade100,
                                      backgroundImage: NetworkImage(_computerScienceCourse.imageUrl),
                                      onBackgroundImageError: (exception, stackTrace) {
                                        Image.asset('assets/placeholder.png');
                                      },
                                      child: _computerScienceCourse.imageUrl.isEmpty ? Icon(Icons.computer, size: 30, color: Colors.blue.shade800) : null,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _computerScienceCourse.title,
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          _computerScienceCourse.description,
                                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8),
                                        LinearProgressIndicator(
                                          value: _computerScienceCourse.progress,
                                          backgroundColor: Colors.grey[300],
                                          color: Colors.green,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${(_computerScienceCourse.progress * 100).toStringAsFixed(0)}% Concluído',
                                          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.chevron_right),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
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

  Widget _buildInfoCard({required IconData icon, required String title, required String value, required int delay}) {
    return FadeInUp(
      duration: Duration(milliseconds: delay),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        shadowColor: Colors.blue.withOpacity(.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 28, color: Colors.blue.shade800),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
