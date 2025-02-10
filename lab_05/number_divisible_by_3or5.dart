
import 'dart:io';

void main(){
  List <int> list1 = [];
  int sum=0;
  print("Enter Number");
  print("Press -1 to break");
  while(true){
    print("Enter Number Here: ");
    int n= int.parse(stdin.readLineSync()!);
    if(n==-1) break;
    else{
      list1.add(n);
    }
  }
  for(int i=0; i<list1.length; i++){
    if(list1[i]%3 == 0 || list1[i]%5 == 0){
      sum += list1[i];
    }
  }
  print("Sum of All number which are divisible by either 3 or 5: $sum");
}