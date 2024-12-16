import 'dart:io';

void main(){
  print("Enter a Number: ");
  int n= int.parse(stdin.readLineSync()!);
  int reverse=0;
  while(n!=0) {
    reverse = reverse * 10 + n % 10;
    n ~/= 10;
  }
  print("Reverse Number is $reverse");
}