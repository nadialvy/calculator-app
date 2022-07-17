class Utils {
  static bool isOperator(String buttonText, {bool hasEquals = false}){
    final operators = ['+', '-', '÷', 'x', '.']..addAll(hasEquals ? ['='] : []);

    return operators.contains(buttonText);
  }
}