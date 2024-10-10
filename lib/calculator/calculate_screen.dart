import 'package:calculator/calculator/widgetCalculate/button_widget.dart';
import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});
  static const String routeName = "calculator";
  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  String input = '';
  String output = '';
  String operator = '';
  bool bracketsPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Text(
                input,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Text(
                operator,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Text(
                ' = $output',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(
                    color: Colors.blue,
                    number: "C",
                    function: () {
                      onCPressed();
                    }),
                ButtonWidget(
                    color: Colors.blue,
                    number: "(",
                    function: () {
                      bracketsPressed = true;
                      onDigitPressed('(');
                    }),
                ButtonWidget(
                    color: Colors.blue,
                    number: ")",
                    function: () {
                      onDigitPressed(')');
                    }),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          deleteDigit();
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          deleteInput();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Icon(
                        Icons.delete,
                        size: 40,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(
                  color: Colors.blue,
                    number: "1",
                    function: () {
                      onDigitPressed('1');
                    }),
                ButtonWidget(
                    color: Colors.blue,
                    number: "2",
                    function: () {
                      onDigitPressed('2');
                    }),
                ButtonWidget(
                    color: Colors.blue,
                    number: "3",
                    function: () {
                      onDigitPressed('3');
                    }),
                ButtonWidget(
                  color: Colors.black,
                    number: "+",
                    function: () {
                      if (bracketsPressed) {
                        onDigitPressed('+');
                      } else {
                        onOperatorPressed('+');
                      }
                    }),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(
                    color: Colors.blue,
                    number: "4",
                    function: () {
                      onDigitPressed('4');
                    }),
                ButtonWidget(
                    color: Colors.blue,
                    number: "5",
                    function: () {
                      onDigitPressed('5');
                    }),
                ButtonWidget(
                    color: Colors.blue,
                    number: "6",
                    function: () {
                      onDigitPressed('6');
                    }),
                ButtonWidget(
                  color: Colors.black,
                    number: "-",
                    function: () {
                      if (bracketsPressed) {
                        onDigitPressed('-');
                      } else {
                        onOperatorPressed('-');
                      }
                    }),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(
                    color: Colors.blue,
                    number: "7",
                    function: () {
                      onDigitPressed('7');
                    }),
                ButtonWidget(
                    color: Colors.blue,
                    number: "8",
                    function: () {
                      onDigitPressed('8');
                    }),
                ButtonWidget(
                    color: Colors.blue,
                    number: "9",
                    function: () {
                      onDigitPressed('9');
                    }),
                ButtonWidget(
                  color: Colors.black,
                    number: "*",
                    function: () {
                      if (bracketsPressed) {
                        onDigitPressed('*');
                      } else {
                        onOperatorPressed('*');
                      }
                    }),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(
                    color: Colors.blue,
                    number: "0",
                    function: () {
                      onDigitPressed('0');
                    }),
                ButtonWidget(
                    color: Colors.blue,
                    number: ".",
                    function: () {
                      onDotPressed('.');
                    }),
                ButtonWidget(
                    color: Colors.blue,
                    number: "-/+",
                    function: () {
                      onDotPressed('.');
                    }),
                ButtonWidget(
                  color: Colors.black,
                    number: "/",
                    function: () {
                      if (bracketsPressed) {
                        onDigitPressed('/');
                      } else {
                        onOperatorPressed('/');
                      }
                    }),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonWidget(
                color: Colors.black,
                  number: "=",
                  function: () {
                    if (bracketsPressed) {
                      onBracketsEqual();
                    } else {
                      onPressedEqual();
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }

  onDotPressed(String digit) {
    if (!input.endsWith('.') && !input.contains('.')) {
      input += digit;
      setState(() {});
    }
  }

  onDigitPressed(String digit) {
    input += digit;

    setState(() {});
  }

  onOperatorPressed(String digit) {
    if (output.isEmpty) {
      setState(() {
        output = input;
        input = '';
        operator = digit;
      });
    } else {
      setState(() {
        calculate();
        if (digit != '=') {
          operator = digit;
        }
        input = '';
      });
    }
  }

  onPressedEqual() {
    calculate();
    input = '';
    operator = '';
    setState(() {});
  }

  onBracketsEqual() {
    calculateBrackets();
    input = '';
    operator = '';
    bracketsPressed = false;
    setState(() {});
  }

  calculate() {
    switch (operator) {
      case '+':
        output = (double.parse(output) + double.parse(input)).toString();
        break;
      case '-':
        output = (double.parse(output) - double.parse(input)).toString();
        break;
      case '*':
        output = (double.parse(output) * double.parse(input)).toString();
        break;
      case '/':
        output = (double.parse(output) / double.parse(input)).toString();
        break;
    }
  }

  calculateBrackets() {
    for (int i = 0; i < input.length; i++) {
      if (input[i] == '(') {
        for (int j = i + 1; j < input.length-1; j++) {
          if (input[j + 1] == '+') {
            output = (double.parse(input[j]) + double.parse(input[j + 2]))
                .toString();
          } else if (input[j + 1] == '-') {
            output = (double.parse(input[j]) - double.parse(input[j + 2]))
                .toString();
          } else if (input[j + 1] == '*') {
            output = (double.parse(input[j]) * double.parse(input[j + 2]))
                .toString();
          } else if (input[j + 1] == '/') {
            output = (double.parse(input[j]) / double.parse(input[j + 2]))
                .toString();
          }
        }
      }
    }
  }

  deleteDigit() {
    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
    }
  }

  deleteInput() {
    if (input.isNotEmpty) {
      input = '';
    }
  }

  onCPressed() {
    input = '';
    output = '';
    operator = '';
    setState(() {});
  }
}
