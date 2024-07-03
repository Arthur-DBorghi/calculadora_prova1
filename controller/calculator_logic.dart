import 'package:flutter/material.dart';

class VisorController {
  late final TextEditingController control;
  final List<double> nums = [];

  String operation = '';
  String history = '';

  //Instância do controlador do texto
  static VisorController inst = VisorController();

  //Função que define qual valor será desenhado baseado no clique do usuário
  void number(String value) {
    var inserted = control.text;

    if (inserted.length >= 20) {
      control.value = const TextEditingValue(text: 'ERRO: VALOR LONGO');
      return;
    }

    if (inserted == '0') {
      inserted = '';
    }

    if (value != '.') {
      control.value = TextEditingValue(
        text: inserted + value,
      );
    } else if (inserted.isEmpty) {
      control.value = TextEditingValue(
        text: '0$value',
      );
    } else if (!inserted.contains('.')) {
      control.value = TextEditingValue(
        text: inserted + value,
      );
    }
  }

  //Preenche o histórico
  void fillHistory(String value) {
    if (value == '') {
      history = '';
    } else {
      history += value;
    }
  }

  //Deleta o último número digitado do visor
  void backspace() {
    var text = control.text;
    if (text.length == 1) {
      control.value = const TextEditingValue(
        text: '0',
      );
    } else {
      control.value = TextEditingValue(
        text: text.substring(0, text.length - 1),
      );
    }
  }

  //Limpa o visor, números e histórico por completo
  void clean(bool historyClean) {
    if (historyClean) {
      fillHistory('');
      operation = '';
      nums.clear();
    }

    control.value = const TextEditingValue(
      text: '0',
    );
  }

  //Verifica se um valor passado é float
  bool floatCheck(String val) {
    String floatingPoint = val.toString().split('.')[1];
    bool res = int.parse(floatingPoint) != 0;
    return res;
  }

  //Define a operação de porcentagem
  void percentage() {
    var text = control.text;
    if (nums.isEmpty) {
      text = (double.parse(text) / 100).toString();
      control.value = TextEditingValue(
        text: text,
      );
    } else {
      double response = (nums[0] / 100) * double.parse(text);
      control.value = TextEditingValue(
        text: response.toString(),
      );
    }
  }

  //Realiza o cálculo
  void calculate() {
    double response = 0;

    switch (operation) {
      case '+':
        response = nums[0] + nums[1];
        break;
      case '-':
        response = nums[0] - nums[1];
        break;
      case '/':
        if (operation == '/' && nums[1] == 0) {
          nums.clear();
          fillHistory('');
          fillHistory('Divisão por zero!');
          return;
        }
        response = nums[0] / nums[1];
        break;
      case 'X':
        response = nums[0] * nums[1];
        break;
    }

    nums.clear();
    nums.add(response);
    if (floatCheck(response.toString())) {
      fillHistory('= $response');
    } else {
      fillHistory('= ${response.toInt()}');
    }
  }

  //Escreve a operação na tela
  void showOperation(String op) {
    if (history.contains('zero') || control.text.length >= 20) {
      fillHistory('');
      return;
    }

    fillHistory(control.text);

    if (history.contains('=')) {
      fillHistory('');
      fillHistory('${nums[0].toString()} $op');
    } else {
      nums.add(double.parse(control.text));
    }

    if (operation.isEmpty) {
      operation = op;
      fillHistory(op);
    } else {
      operation = op;
      fillHistory('');
      if (floatCheck(nums[0].toString())) {
        fillHistory('${nums[0].toString()} $op');
      } else {
        fillHistory('${nums[0].toInt().toString()} $op');
      }
      clean(false);
      return;
    }

    clean(false);
  }

  //Coloca o resultado final
  void showResult() {
    var inserted = control.text;

    if (inserted.length >= 20) {
      fillHistory('');
      return;
    }

    if (history.contains('=')) {
      fillHistory('');

      nums.insert(1, double.parse(control.text));

      if (floatCheck(nums[0].toString())) {
        fillHistory('${nums[0].toString()} $operation');
      } else {
        fillHistory('${nums[0].toInt().toString()} $operation');
      }

      if (floatCheck(nums[1].toString())) {
        fillHistory(nums[1].toString());
      } else {
        fillHistory(nums[1].toInt().toString());
      }
    } else {
      if (operation.isEmpty) {
        return;
      }
      nums.insert(1, double.parse(control.text));
      fillHistory(control.text);
    }

    clean(false);
    calculate();
  }
}
