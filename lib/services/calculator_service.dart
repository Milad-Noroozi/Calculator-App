class CalculatorService {
  static double calculate(String expression) {
    expression = expression.replaceAll(' ', '');
    expression = expression.replaceAll('x', '*');
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll('–', '-');
    
    try {
      return _evaluateExpression(expression);
    } catch (e) {
      throw Exception('خطا در محاسبه');
    }
  }

  static double _evaluateExpression(String expression) {
    expression = _processPercentage(expression);
    return _processOperations(expression);
  }

  static String _processPercentage(String expression) {
    while (expression.contains('%')) {
      int index = expression.indexOf('%');
      int start = index - 1;
      
      while (start >= 0 && (expression[start].contains(RegExp(r'[0-9.]')))) {
        start--;
      }
      start++;
      
      String numberStr = expression.substring(start, index);
      double number = double.parse(numberStr);
      double percentage = number / 100;
      
      expression = expression.substring(0, start) + 
                  percentage.toString() + 
                  expression.substring(index + 1);
    }
    return expression;
  }

  static double _processOperations(String expression) {
    List<double> numbers = [];
    List<String> operators = [];
    
    String currentNumber = '';
    bool isNegative = false;
    
    for (int i = 0; i < expression.length; i++) {
      String char = expression[i];
      
      if (char.contains(RegExp(r'[0-9.]'))) {
        currentNumber += char;
      } else if (char == '-' && (i == 0 || expression[i-1].contains(RegExp(r'[+\-*/]')))) {
        isNegative = true;
      } else {
        if (currentNumber.isNotEmpty) {
          double num = double.parse(currentNumber);
          if (isNegative) {
            num = -num;
            isNegative = false;
          }
          numbers.add(num);
          currentNumber = '';
        }
        operators.add(char);
      }
    }
    
    if (currentNumber.isNotEmpty) {
      double num = double.parse(currentNumber);
      if (isNegative) num = -num;
      numbers.add(num);
    }

    // عملیات ضرب و تقسیم
    for (int i = 0; i < operators.length; i++) {
      if (operators[i] == '*' || operators[i] == '/') {
        double result;
        if (operators[i] == '*') {
          result = numbers[i] * numbers[i + 1];
        } else {
          if (numbers[i + 1] == 0) throw Exception('تقسیم بر صفر');
          result = numbers[i] / numbers[i + 1];
        }
        
        numbers[i] = result;
        numbers.removeAt(i + 1);
        operators.removeAt(i);
        i--;
      }
    }

    // عملیات جمع و تفریق
    for (int i = 0; i < operators.length; i++) {
      if (operators[i] == '+' || operators[i] == '-') {
        double result;
        if (operators[i] == '+') {
          result = numbers[i] + numbers[i + 1];
        } else {
          result = numbers[i] - numbers[i + 1];
        }
        
        numbers[i] = result;
        numbers.removeAt(i + 1);
        operators.removeAt(i);
        i--;
      }
    }

    return numbers.first;
  }

  static String formatResult(double result) {
    if (result == result.toInt()) {
      return result.toInt().toString();
    } else {
      return result.toStringAsFixed(8)
          .replaceAll(RegExp(r'0*$'), '')
          .replaceAll(RegExp(r'\.$'), '');
    }
  }
}