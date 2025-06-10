import 'package:flutter/material.dart'; 
import 'package:todolist/utils/my_button.dart';

class DialogBox extends StatelessWidget {

  // Parâmetros finais (imutáveis) do widget
  final TextEditingController controller;  
  final VoidCallback onSave;
  final VoidCallback onCancel;

  // Construtor do widget com parâmetros obrigatórios
  const DialogBox({
    super.key, 
    required this.controller, // required -> obrigatório
    required this.onSave,
    required this.onCancel,
  });

  // Método que define a estrutura de UI do componente (Widget)
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 150,
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nova atividade",
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 4), // Espaço entre as caixas
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}