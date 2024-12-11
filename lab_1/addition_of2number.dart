import 'dart:io';

void main(){
  print("Enter Number1:");
  int a=int.parse(stdin.readLineSync()!);
  print("Enter Number2:");
  int b=int.parse(stdin.readLineSync()!);
  print("Addition is ${a+b}");
}
