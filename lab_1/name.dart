import 'dart:io';

void main(){
  // String message = 'Jineesh';
  print("Enter your name:");
  String message=stdin.readLineSync()!;
  print("Your name is: $message");
}