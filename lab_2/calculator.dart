import 'dart:io';

void main(){
  print("Enter a number1:");
  int a=int.parse(stdin.readLineSync()!);
  print("Enter a number2:");
  int b=int.parse(stdin.readLineSync()!);
  print("Enter choice:\n"
      "1. Addition\n"
      "2. Subtraction\n"
      "3. Multiplication\n"
      "4. Division:\n"
      "5. Modulo");
  int choice=int.parse(stdin.readLineSync()!);
  switch(choice){
    case 1:
      print("Addition:${a+b}");
      break;
    case 2:
      print("Subtraction:${a-b}");
      break;
    case 3:
      print("Multiplication:${a*b}");
      break;
    case 4:
      print("Division:${a/b}");
      break;
    case 5:
      print("Modulo:${a%b}");
      break;
  }
}