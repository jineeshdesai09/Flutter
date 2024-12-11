import 'dart:io';

void main(){
  print("enter in meter:");
  double a=double.parse(stdin.readLineSync()!);
  double f= a*3.28084;
  print(f);
}