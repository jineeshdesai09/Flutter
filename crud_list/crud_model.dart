// class CrudModel {
//   List<dynamic> crudUserList = [];
//
//   void addUserInList(dynamic user) {
//     crudUserList.add(user);
//   }
//
//   void editUserInList(int index, Map<dynamic, dynamic> user) {
//     crudUserList[index] = user;
//     // print(crudUserList);
//   }
//
//   void deleteUserInList(index) {
//     crudUserList.removeAt(index);
//   }
//
//   List<dynamic> getUserInList() {
//     print(crudUserList);
//     return crudUserList;
//   }
//
//   void toggleFav(index) {
//     crudUserList[index]['IS_FAV'] = !crudUserList[index]['IS_FAV'];
//   }
// }
class StudentModel {
  String name;
  String email;
  bool isFavourite;

  StudentModel({
    required this.name,
    required this.email,
    this.isFavourite = false
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'isFavourite': isFavourite
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'],
      email: map['email'],
      isFavourite: map['isFavourite'] ?? false,
    );
  }
}

class StudentList {
  static List<dynamic> students = [];

  static void addStudent(StudentModel student) {
    students.add(student.toMap());
  }

  static void updateStudent(int index, StudentModel student) {
    if (index >= 0 && index < students.length) {
      students[index] = student.toMap();
    }
  }

  static void deleteStudent(int index) {
    if (index >= 0 && index < students.length) {
      students.removeAt(index);
    }
  }

  static void toggleFavourite(int index) {
    if (index >= 0 && index < students.length) {
      final student = students[index] as StudentModel;
      student.isFavourite = !student.isFavourite;
    }
  }

  static List<StudentModel> getStudents() {
    return students
        .map((dynamic item) =>
        StudentModel.fromMap(item as Map<String, dynamic>))
        .toList();
  }
}