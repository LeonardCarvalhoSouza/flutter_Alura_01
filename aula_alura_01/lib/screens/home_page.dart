import 'package:aula_alura_01/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:aula_alura_01/components/task.dart';

class InitialScren extends StatefulWidget {
  const InitialScren({Key? key}) : super(key: key);

  @override
  State<InitialScren> createState() => _InitialScrenState();
}

class _InitialScrenState extends State<InitialScren> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          Task('Aprender Flutter', 'assets/images/dash.png', 3),
          Task('Andar de Bike', 'assets/images/bike.webp', 3),
          Task('Ler um Livro ', 'assets/images/livro.jpg', 3),
          Task('Meditar', 'assets/images/meditar.jpeg', 3),
          Task('Jogar ', 'assets/images/jogar.jpg', 3),
          SizedBox(
            height: 20,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
