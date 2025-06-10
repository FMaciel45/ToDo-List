import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;

  Function(bool?)? onChanged; 
    // (bool?) -> pode ser bool ou null
    // Function(bool?)? -> a função pode existir ou ser null 

  Function (BuildContext)? deleteFunction;
  
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted, 
    required this.onChanged,
    required this.deleteFunction,
  });

  // Método que define a estrutura de UI do componente (Widget)
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25, bottom: 0, left: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),

        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged
              ),
              
              Text(
                taskName,
                style: TextStyle(decoration: taskCompleted 
                  ? TextDecoration.lineThrough 
                  : TextDecoration.none
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}