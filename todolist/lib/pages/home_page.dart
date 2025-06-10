import 'package:flutter/material.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/utils/dialog_box.dart';
import 'package:todolist/utils/todo_tile.dart';

// StatefulWidget que representa a página principal do aplicativo
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Estado da página principal que contém a lógica e os dados mutáveis
class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController(); // Controller para o campo de texto Dialog Box (+)
  final ToDoDatabase db = ToDoDatabase(); // Instância do BD para persistência das tarefas

  @override
  void initState() { // Método chamado quando o widget é inserido na árvore de widgets (antes da renderização)
    super.initState();
    db.loadData(); // Carrega os dados salvos em memória ao iniciar a tela
  }

  // Para o checkbox das tarefas
  void checkBoxChanged(bool? value, int index) { // ? -> pode ser null
    setState(() { // SetState -> reconstrói a UI quando os dados do estado de um widget mudam
      db.toDoList[index][1] = !db.toDoList[index][1]; // Inverte o status
      db.updateDatabase(); // Atualiza o BD
    });
  }

  void saveNewTask() {
    setState(() { 
      db.toDoList.add([_controller.text, false]); // Adiciona nova tarefa à lista (texto digitado + status não concluído)

      _controller.clear(); // Limpa a caixa de texto para próximas adições
      db.updateDatabase(); 
    });
    Navigator.of(context).pop();
  }

  // Método para abrir o Dialog Box (+) para criação de nova tarefa
  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(), // Fecha a caixa ao cancelar
        );
      }
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateDatabase(); 
    });
  }
  
  @override
  Widget build(BuildContext context) { // Método que define a estrutura de UI da página
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("ToDoList"),
        centerTitle: true,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        }
      ),
    );
  }
}