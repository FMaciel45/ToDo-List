import 'package:hive/hive.dart';

/* 
 Para armazenamento de dados -> Hive (armazenamento local)
  - Usa o IndexedDB (NoSQL)
  - Leve e rápido
*/ 

class ToDoDatabase {
  List toDoList = []; // Lista que armazena as tarefas em memória (local)
  // Formato da lista -> [descrição_tarefa, concluído_ou_não]

  // '_' -> torna o campo privado (só pode ser acessado dentro da classe)
  final _dataBox = Hive.box('dataBox');

  // Carrega os dados do armazenamento local
  void loadData() {
    if (_dataBox.get("TODOLIST") == null) { // Se não existirem dados salvos, cria dados iniciais
      createInitialData();
    } else { // Se existirem, pega na lista em memória
      toDoList = _dataBox.get("TODOLIST");
    }
  }

  // Cria dados iniciais para quando o app é executado pela primeira vez
  void createInitialData() {
    toDoList = [
      ["Tarefa exemplo", false]
    ];
    updateDatabase();
  }

  void updateDatabase() {
    _dataBox.put("TODOLIST", toDoList);
  }
}