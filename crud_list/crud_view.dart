import 'package:flutter/material.dart';

import '../../utils/import_export.dart';
import 'crud_controller.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final StudentController _controller = StudentController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _showDialog({StudentModel? student, int? index}) {
    _nameController.text = student?.name ?? '';
    _emailController.text = student?.email ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(student == null ? 'Add Student' : 'Edit Student'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final newStudent = StudentModel(
                name: _nameController.text,
                email: _emailController.text,
              );

              if (student == null) {
                _controller.addStudent(newStudent);
              } else {
                _controller.updateStudent(index!, newStudent);
              }

              setState(() {});
              Navigator.pop(context);
            },
            child: Text(student == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final students = _controller.getAllStudents();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student CRUD'),
      ),
      body: students.isEmpty
          ? const Center(child: Text('No students found'))
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text(student.email),
            
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {
                  setState(() {
                    _controller.favouriteStudent(index);
                  });
                }, icon: Icon(student.isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: student.isFavourite ? Colors.red : null,)),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showDialog(
                    student: student,
                    index: index,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _controller.deleteStudent(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}