import 'dart:io';

void main(){
  int fact=1;
  print("Enter a Number:");
  int n= int.parse(stdin.readLineSync()!);
  for(int i=2; i<=n; i++){
    fact = fact*i;
  }
  print("$n factorial number is $fact");
}