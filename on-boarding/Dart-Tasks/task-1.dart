
import 'dart:async';
import 'dart:io';
import 'dart:math';

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) throw DivisionByZeroException();
    return a / b;
  }
  double modulus(double a, double b) => a % b;
  double power(double a, double b) => pow(a, b).toDouble();
}

class DivisionByZeroException implements Exception {
  @override String toString() => '\nDivision by zero';
}

class InvalidOperatorException implements Exception {
  final String op;
  InvalidOperatorException(this.op);
  @override String toString() => '\nInvalid operator: $op';
}

void main() async {
  final calc = Calculator();
  print('\nC A L C U L A T O R\n\nOperations: + - * / % ^');
  
  while (true) {
    try {
      stdout.write('\nFirst number: ');
      final a = double.parse(stdin.readLineSync()!);
      
      stdout.write('\nOperator: ');
      final op = stdin.readLineSync()!.trim();
      
      stdout.write('\nSecond number: ');
      final b = double.parse(stdin.readLineSync()!);

      final result = switch(op) {
        '+' => calc.add(a, b),
        '-' => calc.subtract(a, b),
        '*' => calc.multiply(a, b),
        '/' => calc.divide(a, b),
        '%' => calc.modulus(a, b),
        '^' => calc.power(a, b),
        _ => throw InvalidOperatorException(op),
      };

      print('\nCalculating...');
      await Future.delayed(Duration(seconds: 5));
      print('\n$a $op $b = $result');
    } on FormatException {
      print('\nInvalid number');
    } on DivisionByZeroException catch (e) {
      print(e);
    } on InvalidOperatorException catch (e) {
      print(e);
    }

    stdout.write('\nContinue? (y/n): ');
    if (stdin.readLineSync()?.toLowerCase() != 'y') break;
    print('');
  }
  print('\nGoodbye');
}
