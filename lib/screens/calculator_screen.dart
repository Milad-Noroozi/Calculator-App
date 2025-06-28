import 'package:flutter/material.dart';
import '../widgets/calculator_display.dart';
import '../widgets/calculator_buttons.dart';
import '../services/calculator_service.dart';
import '../utils/constants.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _inputExpression = '';
  String _calculationResult = '0';
  bool _hasDecimalPoint = false;
  bool _justCalculated = false;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _clear();
      } else if (buttonText == '=') {
        _calculate();
      } else if (buttonText == 'del') {
        _delete();
      } else if (buttonText == '.') {
        _addDecimalPoint();
      } else if (_isOperator(buttonText)) {
        _addOperator(buttonText);
      } else {
        _addNumber(buttonText);
      }

      if (_inputExpression.isEmpty && !_justCalculated) {
        _calculationResult = '0';
        _hasDecimalPoint = false;
      }
    });
  }

  void _clear() {
    _inputExpression = '';
    _calculationResult = '0';
    _hasDecimalPoint = false;
    _justCalculated = false;
  }

  void _calculate() {
    if (_inputExpression.isNotEmpty) {
      try {
        double result = CalculatorService.calculate(_inputExpression);
        _calculationResult = CalculatorService.formatResult(result);
        _justCalculated = true;
        _hasDecimalPoint = _calculationResult.contains('.');
      } catch (e) {
        _calculationResult = 'خطا';
        _justCalculated = true;
      }
    }
  }

  void _delete() {
    if (_inputExpression.isNotEmpty) {
      String lastChar = _inputExpression[_inputExpression.length - 1];
      if (lastChar == '.') {
        _hasDecimalPoint = false;
      }
      _inputExpression = _inputExpression.substring(0, _inputExpression.length - 1);
      _hasDecimalPoint = _inputExpression.contains('.');
    }
  }

  void _addDecimalPoint() {
    if (!_hasDecimalPoint) {
      if (_justCalculated) {
        _inputExpression = '0.';
        _justCalculated = false;
      } else if (_inputExpression.isEmpty || 
                _inputExpression[_inputExpression.length - 1].contains(RegExp(r'[+\-*/]'))) {
        _inputExpression += '0.';
      } else {
        _inputExpression += '.';
      }
      _hasDecimalPoint = true;
    }
  }

  void _addOperator(String operator) {
    if (_justCalculated && _calculationResult != 'خطا') {
      _inputExpression = _calculationResult + operator;
      _justCalculated = false;
    } else if (_inputExpression.isNotEmpty && 
              !_inputExpression[_inputExpression.length - 1].contains(RegExp(r'[+\-*/x÷–%]'))) {
      _inputExpression += operator;
    } else if (_inputExpression.isNotEmpty) {
      _inputExpression = _inputExpression.substring(0, _inputExpression.length - 1) + operator;
    }
    _hasDecimalPoint = false;
  }

  void _addNumber(String number) {
    if (_justCalculated) {
      _inputExpression = number;
      _justCalculated = false;
      _hasDecimalPoint = false;
    } else {
      _inputExpression += number;
    }
  }

  bool _isOperator(String text) {
    return ['+', '-', '*', '/', '%', 'x', '÷', '–'].contains(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 50),
          
          const Text(
            "Calculator",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),

          CalculatorDisplay(
            inputExpression: _inputExpression,
            calculationResult: _calculationResult,
          ),

          CalculatorButtons(
            onButtonPressed: _onButtonPressed,
          ),
        ],
      ),
    );
  }
}