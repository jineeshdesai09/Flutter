import 'dart:io';

void main(){
  print("Enter a Number: ");
  int n= int.parse(stdin.readLineSync()!);
  int flag=0;
  for(int i=2; i<n; i++){
    if(n%i==0){
      flag=1;
      break;
    }
  }
  if(flag==0){
    print("Given number $n is prime number");
  }
  else{
    print("Given number $n is not prime number");
  }
}