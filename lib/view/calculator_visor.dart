import 'package:calculadora_prova1/controller/calculator_logic.dart';
import 'package:calculadora_prova1/model/buttons.dart';
import 'package:flutter/material.dart';

class CalculatorMainPage extends StatefulWidget {
  const CalculatorMainPage({super.key});

  @override
  State<CalculatorMainPage> createState() => _CalculatorMainPageState();
}

class _CalculatorMainPageState extends State<CalculatorMainPage> {
  @override
  void initState() {
    VisorController.inst.control = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    VisorController.inst.control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                border: const Border(
                    bottom: BorderSide(width: 1, color: Colors.amber)),
                color: Colors.grey.shade900,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        VisorController.inst.history,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 22,
                          overflow: TextOverflow.fade,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: TextField(
                        controller: VisorController.inst.control,
                        textAlign: TextAlign.right,
                        readOnly: true,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                            overflow: TextOverflow.fade),
                        decoration: null,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    ButtonModel(
                      content: 'AC',
                      pressed: () => setState(
                        () {
                          VisorController.inst.clean(true);
                        },
                      ),
                      buttonType: 'CLEAR',
                    ),
                    ButtonModel(
                      content: Icons.backspace_outlined,
                      pressed: () => setState(
                        () {
                          VisorController.inst.backspace();
                        },
                      ),
                      buttonType: 'BACK',
                    ),
                    ButtonModel(
                      content: '%',
                      pressed: () => setState(
                        () {
                          VisorController.inst.percentage();
                        },
                      ),
                      buttonType: 'PERC',
                    ),
                    ButtonModel(
                      content: '/',
                      pressed: () => setState(
                        () {
                          VisorController.inst.showOperation('/');
                        },
                      ),
                      buttonType: 'DIVISION',
                    ),
                  ],
                ),
                Row(
                  children: [
                    ButtonModel(
                      content: '7',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('7');
                        },
                      ),
                      buttonType: '7',
                    ),
                    ButtonModel(
                      content: '8',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('8');
                        },
                      ),
                      buttonType: '8',
                    ),
                    ButtonModel(
                      content: '9',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('9');
                        },
                      ),
                      buttonType: '9',
                    ),
                    ButtonModel(
                      content: 'X',
                      pressed: () => setState(
                        () {
                          VisorController.inst.showOperation('X');
                        },
                      ),
                      buttonType: 'MULTI',
                    ),
                  ],
                ),
                Row(
                  children: [
                    ButtonModel(
                      content: '4',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('4');
                        },
                      ),
                      buttonType: '4',
                    ),
                    ButtonModel(
                      content: '5',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('5');
                        },
                      ),
                      buttonType: '5',
                    ),
                    ButtonModel(
                      content: '6',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('6');
                        },
                      ),
                      buttonType: '6',
                    ),
                    ButtonModel(
                      content: '-',
                      pressed: () => setState(
                        () {
                          VisorController.inst.showOperation('-');
                        },
                      ),
                      buttonType: 'MINUS',
                    ),
                  ],
                ),
                Row(
                  children: [
                    ButtonModel(
                      content: '1',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('1');
                        },
                      ),
                      buttonType: '1',
                    ),
                    ButtonModel(
                      content: '2',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('2');
                        },
                      ),
                      buttonType: '2',
                    ),
                    ButtonModel(
                      content: '3',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('3');
                        },
                      ),
                      buttonType: '3',
                    ),
                    ButtonModel(
                      content: '+',
                      pressed: () => setState(
                        () {
                          VisorController.inst.showOperation('+');
                        },
                      ),
                      buttonType: 'PLUS',
                    ),
                  ],
                ),
                Row(
                  children: [
                    ButtonModel(
                      content: '0',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('0');
                        },
                      ),
                      buttonType: '0',
                    ),
                    ButtonModel(
                      content: '.',
                      pressed: () => setState(
                        () {
                          VisorController.inst.number('.');
                        },
                      ),
                      buttonType: '.',
                    ),
                    ButtonModel(
                      content: '=',
                      pressed: () => setState(
                        () {
                          VisorController.inst.showResult();
                        },
                      ),
                      buttonType: 'RES',
                      buttonWidth: 2,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
