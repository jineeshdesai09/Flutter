import 'package:get/get.dart';
import '../model/rx_crud_model.dart';

class RxCrudController extends GetxController {

  RxList<RxCrudModel> students = <RxCrudModel>[].obs;

  void addItem(String name) {
    if (name.trim().isNotEmpty) {
      students.add(RxCrudModel(name: name));
    }
  }

  void updateItem(int index, String newName) {
    if (newName.trim().isNotEmpty) {
      students[index].name = newName;
      students.refresh();
    }
  }

  void deleteItem(int index) {
    students.removeAt(index);
  }

  void toggleFavorite(int index) {
    students[index].isFavorite = !students[index].isFavorite;
    students.refresh(); // update list
  }
}
