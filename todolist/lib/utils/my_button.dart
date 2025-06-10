import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  
  final String text;
  VoidCallback onPressed; // Função chamada ao pressionar (não possui "final" -> mutável)

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  // Método que define a estrutura de UI do componente (Widget)
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.blueGrey,
      child: Text(text),
    );
  }
}