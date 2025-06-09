import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;

  Function(bool?)? onChanged;
  
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted, 
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25, bottom: 0, left: 25),
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
    );
  }
}