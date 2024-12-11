import 'dart:io';

void main(){
  print("Enter temperature in fahrenheit:");
  double f=double.parse(stdin.readLineSync()!);
  double c=(f-32)*(5/9);
  print(c);
}