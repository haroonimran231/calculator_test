import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      home: Scaffold(
        appBar: AppBar(
          title:
              Text('Flutter Calculator', style: TextStyle(color: Colors.white)),
        ),
        body: Calculator(),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CalculatorButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
            selectionColor: const Color.fromARGB(255, 54, 4, 63),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // variables to store the operands, operator and result
  String firstOperand = '';
  String secondOperand = '';
  String operator = '';
  String result = '';

  // function to append a digit to the current operand
  void appendDigit(String digit) {
    setState(() {
      if (operator.isEmpty) {
        // if no operator is selected, append to the first operand
        firstOperand += digit;
      } else {
        // otherwise, append to the second operand
        secondOperand += digit;
      }
    });
  }

  // function to select an operator
  void selectOperator(String op) {
    setState(() {
      if (firstOperand.isNotEmpty) {
        // if the first operand is not empty, select the operator
        operator = op;
      }
    });
  }

  // function to clear the operands, operator and result
  void clear() {
    setState(() {
      firstOperand = '';
      secondOperand = '';
      operator = '';
      result = '';
    });
  }

  // function to perform the calculation and display the result
  void calculate() {
    setState(() {
      if (firstOperand.isNotEmpty &&
          secondOperand.isNotEmpty &&
          operator.isNotEmpty) {
        // if both operands and operator are not empty, perform the calculation
        int first = int.parse(firstOperand);
        int second = int.parse(secondOperand);
        int res = 0;
        switch (operator) {
          case '+':
            res = first + second;
            break;
          case '-':
            res = first - second;
            break;
          case 'x':
            res = first * second;
            break;
          case '/':
            res = first ~/ second; // integer division
            break;
        }
        // display the result as a string
        result = res.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // display the current calculation and result
        Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(16),
            child: Text(
              '$firstOperand $operator $secondOperand \n Total : $result',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ),
        // create a row of buttons for each row of digits and operators
        Row(
          children: [
            CalculatorButton(
              text: '7',
              onPressed: () => appendDigit('7'),
            ),
            CalculatorButton(
              text: '8',
              onPressed: () => appendDigit('8'),
            ),
            CalculatorButton(
              text: '9',
              onPressed: () => appendDigit('9'),
            ),
            CalculatorButton(
              text: '+',
              onPressed: () => selectOperator('+'),
            ),
          ],
        ),
        Row(
          children: [
            CalculatorButton(
              text: '4',
              onPressed: () => appendDigit('4'),
            ),
            CalculatorButton(
              text: '5',
              onPressed: () => appendDigit('5'),
            ),
            CalculatorButton(
              text: '6',
              onPressed: () => appendDigit('6'),
            ),
            CalculatorButton(
              text: '-',
              onPressed: () => selectOperator('-'),
            ),
          ],
        ),
        Row(
          children: [
            CalculatorButton(
              text: '1',
              onPressed: () => appendDigit('1'),
            ),
            CalculatorButton(
              text: '2',
              onPressed: () => appendDigit('2'),
            ),
            CalculatorButton(
              text: '3',
              onPressed: () => appendDigit('3'),
            ),
            CalculatorButton(
              text: 'x',
              onPressed: () => selectOperator('x'),
            ),
          ],
        ),
        Row(
          children: [
            CalculatorButton(
              text: 'C',
              onPressed: clear,
            ),
            CalculatorButton(
              text: '0',
              onPressed: () => appendDigit('0'),
            ),
            CalculatorButton(
              text: '=',
              onPressed: calculate,
            ),
            CalculatorButton(
              text: '/',
              onPressed: () => selectOperator('/'),
            ),
          ],
        ),
      ],
    );
  }
}
