double calc(int number1, int number2, String operator) {
  double result = 0;

  switch (operator) {
    case "+":
      result = (number1 + number2).toDouble();
      break;
    case "-":
      result = (number1 - number2).toDouble();
      break;
    case "*":
      result = (number1 * number2).toDouble();
      break;
    case "/":
      result = number1 / number2;
      break;
    default:
  }

  return result;
}

void main() {
  const int number1 = 20;
  const int number2 = 3;
  const String operator = "/";
  final result = calc(number1, number2, operator);

  print('Hasil: $number1 $operator $number2 = $result');

  for (var i = 1; i <= 20; i++) {
    if(i % 2 == 0) {
      print('No: $i');
    }
  }
}