import 'package:aula_alura_01/data/talk_inherited.dart';
import 'package:aula_alura_01/screens/form_screen.dart';
import 'package:flutter/material.dart';

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
        children: TaskInherited.of(context).taskList,
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
