import 'dart:io';

void main(){
  print("Enter a starting number: ");
  int a=int.parse(stdin.readLineSync()!);
  print("Enter a ending number: ");
  int b=int.parse(stdin.readLineSync()!);

  for(int i=a;i<=b;i++){
    if(i%2==0 && i%3!=0){
      print(i);
    }
  }
}