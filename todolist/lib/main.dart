import 'package:flutter/material.dart';
import 'package:todolist/pages/home_page.dart';

void main() {
  runApp(const ToDoList());
}

// stateless widget -> estático e imutável
// stateful widget -> permite mutação de estado

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}