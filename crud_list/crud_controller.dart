import 'crud_model.dart';

class StudentController {
  List<StudentModel> getAllStudents() {
    return StudentList.getStudents();
  }

  void addStudent(StudentModel student) {
    StudentList.addStudent(student);
  }

  void updateStudent(int index, StudentModel student) {
    StudentList.updateStudent(index, student);
  }

  void deleteStudent(int index) {
    StudentList.deleteStudent(index);
  }

  void favouriteStudent(int index){
    StudentList.toggleFavourite(index);
  }
}