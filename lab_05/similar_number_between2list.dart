import 'dart:io';

void main(){
  print("Enter Number of List 1");
  print("Enter -1 to break");
  List<int> list1 = [];
  while(true){
    print("Enter Number Here: ");
    int number1 = int.parse(stdin.readLineSync()!);
    if(number1 == -1) break;
    else list1.add(number1);
  }

  print("Enter Number of List 2");
  print("Enter -1 to break");
  List<int> list2 = [];
  while(true){
    print("Enter Number Here: ");
    int number2 = int.parse(stdin.readLineSync()!);
    if(number2 == -1) break;
    else list2.add(number2);
  }

  List<int> list3 = [];
  for(int i=0; i<list1.length; i++){
    if(list2.contains(list1[i])){
      list3.add(list1[i]);
    }
  }
  print("List 1 $list1");
  print("List 2 $list2");
  print("Common Number is: $list3");
}