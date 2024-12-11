import 'dart:io';

void main(){
  print("Enter mark of subject1:");
  double a=double.parse(stdin.readLineSync()!);
  print("Enter mark of subject2:");
  double b=double.parse(stdin.readLineSync()!);
  print("Enter mark of subject3:");
  double c=double.parse(stdin.readLineSync()!);
  print("Enter mark of subject4:");
  double d=double.parse(stdin.readLineSync()!);
  print("Enter mark of subject5:");
  double e=double.parse(stdin.readLineSync()!);
  double result=(a+b+c+d+e)/5;
  print(result);

  if(result<35){
    print("Class:Fail");
  }
  else if(result>=35 && result<45){
    print("Class:Pass");
  }
  else if(result>=45 && result<60){
    print("Class:Second");
  }
  else if(result>=60 && result<70){
    print("Class:First");
  }
  else{
    print("Class:Distinction");
  }
}