import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: const Text('Tarefas'),
          ),
          body: ListView(
            children: const [
              Task(
                  'Aprender Flutter',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  3),
              Task(
                  'Banco de dados',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  3),
              Task('Conseguir um emprego ', '', 3),
            ],
          ),
        ));
  }
}

class Task extends StatefulWidget {
  final int dificuldade;
  final String? nome;
  final String foto;
  const Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                      child: Image.network(
                        widget.foto,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            widget.nome!,
                            style: const TextStyle(
                                fontSize: 24, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 1)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 2)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 3)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 4)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 5)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Icon(Icons.arrow_drop_up),
                            Text(
                              'UP',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nivel: $nivel',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
