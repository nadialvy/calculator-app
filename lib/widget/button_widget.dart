import 'package:calculator_app/colors.dart';
import 'package:calculator_app/utils.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final String text;
  final VoidCallback onClicked;
  final VoidCallback onClickedLong;


  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.onClickedLong})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = getTextColor(text);
    final double fontSize = Utils.isOperator(text, hasEquals: true) ? 26 : 22;
    final style = TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

    return Expanded(
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: onClicked,
          onLongPress: onClickedLong,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: ColorsApp.background3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: text == '<' ?
          const Icon(Icons.backspace_outlined, color: ColorsApp.delete)
          :
          Text(text, style: style,)
        ),
      ),
    );
  }

  Color getTextColor(String buttonText){
    switch(buttonText){
      case '+':
      case '÷':
      case '−':
      case '×':
      case '=':
        return ColorsApp.operators;
      case '<':
      case 'AC':
        return ColorsApp.delete;
      default :
        return ColorsApp.numbers;
    }
  }

}