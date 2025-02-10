import 'dart:io';

void main(){
  List<String> list = [];
  print("Enter City Name");
  print("Press -1 to break");
  String city = stdin.readLineSync()!;

  do{
    print("Enter City Name Here: ");
    list.add(city);
    city = stdin.readLineSync()!;

  }while(city!="-1");

  for(int i=0; i<list.length; i++){
    if(list[i] == 'Ahmedabad' ){
      list[i] = 'Surat';
    }
  }
  print("List $list");
}