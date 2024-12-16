import 'dart:io';

void main() {
  stdout.write("Enter size of List ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> list = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number ");
    int n= int.parse(stdin.readLineSync()!);
    list.add(n);
  }

  stdout.write("Enter number to insert ");
  int num= int.parse(stdin.readLineSync()!);
  stdout.write("Enter position to insert ");
  int position= int.parse(stdin.readLineSync()!);

  if (position >= 0 && position <= list.length) {
    list.insert(position, num);
  } else {
    print("Invalid position.");
  }
  print(list);
}