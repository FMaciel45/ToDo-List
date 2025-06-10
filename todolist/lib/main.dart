import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que os bindings do Flutter estão inicializados antes de qualquer operação
  await Hive.initFlutter(); // Inicializa o Hive 
  await Hive.openBox('dataBox'); // Abre ou cria (caso não exista) uma "box" para armazenamento de dados

  runApp(const ToDoList());
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Para não mostrar a faixa "debug"
      home: HomePage(), // Define HomePage como a tela inicial do app
    );
  }
}