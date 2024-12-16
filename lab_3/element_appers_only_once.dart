import 'dart:io';

void main() {
  stdout.write("Enter size of List ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> list = [];
  int ans = 0;

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number ");
    int n1 = int.parse(stdin.readLineSync()!);
    list.add(n1);
  }

  for (int i = 0; i < n; i++) {
    ans ^= list[i];
  }

  print(ans);
}