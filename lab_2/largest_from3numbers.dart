import 'dart:io';

void main(){
  print("Enter a number1:");
  int a=int.parse(stdin.readLineSync()!);
  print("Enter a number2:");
  int b=int.parse(stdin.readLineSync()!);
  print("Enter a number3:");
  int c=int.parse(stdin.readLineSync()!);
  if (a>=b){
    if (a>=c) {
      print("The largest number is:${a}");
    }
    else{
      print("The largest number is:${c}");
    }
  }
  else{
    if (b>=c) {
      print("The largest number is:${b}");
    }
    else {
      print("The largest number is:${c}");
    }
  }
}