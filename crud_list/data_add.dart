import 'package:flutter/material.dart';

import '../../utils/import_export.dart';
import 'crud_view.dart';

class DataAdd extends StatefulWidget {
  final dynamic user;
  const DataAdd({super.key, this.user});

  @override
  State<DataAdd> createState() => _DataAddState();
}

class _DataAddState extends State<DataAdd> {
  late TextEditingController nameController;
  late TextEditingController rollController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
      text: widget.user != null ? widget.user[USER_NAME] : '',
    );
    rollController = TextEditingController(
      text: widget.user != null ? widget.user[USER_AGE] : '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.user != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Edit User" : "Add User")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: rollController,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                labelText: 'Age',
                hintText: 'Enter your Age',
                prefixIcon: Icon(Icons.trending_up_sharp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (widget.user != null) {
                  int index = CRUDView.crudController.getUserList().indexOf(
                    widget.user,
                  );
                  widget.user[USER_NAME] = nameController.text.toString();
                  widget.user[USER_AGE] = rollController.text.toString();
                  widget.user['IS_FAV'] = widget.user['IS_FAV'] ?? false;
                  CRUDView.crudController.editUserList(index, widget.user);
                } else {
                  Map<dynamic, dynamic> newUser = {};
                  newUser[USER_NAME] = nameController.text.toString();
                  newUser[USER_AGE] = rollController.text.toString();
                  newUser['IS_FAV'] = false;
                  CRUDView.crudController.addUserList(newUser);
                }
                Navigator.pop(context);
              },
              child: Text(isEdit ? "Update" : "Add"),
            ),
          ],
        ),
      ),
    );
  }
}