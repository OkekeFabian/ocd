import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class Todo {
  Todo({@required this.name, @required this.checked});
  final String name;
  bool checked;
}

class TodoItem extends StatelessWidget {
  TodoItem({
    @required this.todo,
    @required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  TextStyle _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}

class LongTermList extends StatefulWidget {
  @override
  _LongTermListState createState() =>  _LongTermListState();
}

class _LongTermListState extends State<LongTermList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo) {
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChange,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return KeyboardDismisser(
            child: AlertDialog(
              title: const Text('Add a new long term goal'),
              content: TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: 'Type your new goal'),
              ),
              actions: <Widget>[

                TextButton(
                  child: const Text('ADD'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _addTodoItem(_textFieldController.text);
                  },
                ),

                TextButton(
                  child: const Text('CANCEL'),

                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )
        );
      },
    );
  }
}

/*
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo list',
      home: new TodoList(),
    );
  }
}

void main() => runApp(new TodoApp());*/
