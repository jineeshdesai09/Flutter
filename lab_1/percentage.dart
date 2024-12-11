import 'dart:io';
void main(){
  print("Enter number of subject:");
  double a = double.parse(stdin.readLineSync()!);
  double sum=0;
  for(int i=0;i<a;i++){
    print("Enter marks of subject ${i+1}:");
    double b = double.parse(stdin.readLineSync()!);
    sum +=b;
  }
  double result=(sum/a);
  print(result);
}