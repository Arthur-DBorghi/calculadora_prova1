import 'package:flutter/material.dart';

class ButtonModel extends StatelessWidget {
  final Object content;
  final double? buttonWidth;
  final VoidCallback pressed;
  final String buttonType;

  const ButtonModel({
    super.key,
    required this.content,
    this.buttonWidth,
    required this.pressed,
    required this.buttonType,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle operationsStyle = const ButtonStyle();
    TextStyle operationsTextStyle = const TextStyle();

    if (buttonType == 'CLEAR' ||
        buttonType == 'BACK' ||
        buttonType == 'PERC' ||
        buttonType == 'DIVISION' ||
        buttonType == 'MULTI' ||
        buttonType == 'MINUS' ||
        buttonType == 'PLUS' ||
        buttonType == '.' ||
        buttonType == 'RES') {
      operationsStyle = ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.grey.shade800),
      );
      operationsTextStyle = const TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      );
    } else {
      operationsTextStyle = const TextStyle(fontSize: 30);
    }

    return SizedBox(
        width: buttonWidth != null
            ? (MediaQuery.of(context).size.width / 4) * buttonWidth!
            : (MediaQuery.of(context).size.width / 4),
        height: MediaQuery.of(context).size.height * 0.13,
        child: SizedBox(
          height: 12,
          width: 12,
          child: ElevatedButton(
            onPressed: pressed,
            style: operationsStyle,
            child: content.runtimeType == String
                ? Text(
                    content.toString(),
                    style: operationsTextStyle,
                  )
                : Icon(
                    content as IconData?,
                    color: Colors.orange,
                  ),
          ),
        ));
  }
}
