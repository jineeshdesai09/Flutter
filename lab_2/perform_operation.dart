import 'dart:io';

void main(){
  stdout.write("Enter Oprator: ");
  String op = stdin.readLineSync()!;
  stdout.write("Enter number 1 ");
  int n1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number 2 ");
  int n2 = int.parse(stdin.readLineSync()!);

  switch(op){
    case '+':
      print("Addtiton of $n1 and $n2 is ${n1+n2}");
      break;
    case '-':
      print("Subtraction of $n1 and $n2 is ${n1-n2}");
      break;
    case '*':
      print("Multiplication of $n1 and $n2 is ${n1*n2}");
      break;
    case '/':
      if(n2==0){
        print("Ghere jai ne sui jaa");
      }
      else{
        print("Division of $n1 and $n2 is ${n1/n2}");
        break;
      }
  }
}