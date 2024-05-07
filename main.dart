import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Lista de Tareas',
      home: MyTaskListPage(),
    );
  }
}

class MyTaskListPage extends StatefulWidget {
  @override
  _MyTaskListPageState createState() => _MyTaskListPageState();
}

class _MyTaskListPageState extends State<MyTaskListPage> {
  List<String> _tasks = ['Tarea 1', 'Tarea 2', 'Tarea 3'];

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicación de Lista de Tareas'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _removeTask(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Agregar Tarea',
              ),
              onSubmitted: (task) {
                _addTask(task);
              },
            ),
          ),
        ],
      ),
    );
  }
}
