import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../database/api_service.dart';
import 'user_data.dart';

class Demo201 extends StatefulWidget {
  const Demo201({super.key});

  @override
  State<Demo201> createState() => _Demo201State();
}

class _Demo201State extends State<Demo201> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
            title: Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  "API Data!!!",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            backgroundColor: Colors.transparent),
      ),
      body: FutureBuilder(
          future: getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              List<User> data = snapshot.data!.reversed.toList().cast<User>(); // Cast to List<User>
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            TextEditingController nameController =
                            TextEditingController(text: data[index].name);
                            TextEditingController emailController =
                            TextEditingController(text: data[index].email ?? ''); // Handle null email
                            TextEditingController phoneController =
                            TextEditingController(text: data[index].phoneNumber ?? ''); // Handle null phone

                            return AlertDialog(
                              title: Text("Edit User"),
                              content: SingleChildScrollView( // To prevent overflow if content is too long
                                child: Column(
                                  mainAxisSize: MainAxisSize.min, // To wrap content
                                  children: [
                                    TextField(
                                      controller: nameController,
                                      decoration: InputDecoration(labelText: 'Name'),
                                    ),
                                    TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(labelText: 'Email'),
                                      keyboardType: TextInputType.emailAddress, // Suggest email keyboard
                                    ),
                                    TextField(
                                      controller: phoneController,
                                      decoration: InputDecoration(labelText: 'Phone Number'),
                                      keyboardType: TextInputType.phone, // Suggest phone keyboard
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () async {
                                    await updateUser(User(
                                        id: data[index].id,
                                        name: nameController.text,
                                        email: emailController.text,
                                        phoneNumber: phoneController.text));
                                    if (context.mounted)
                                      Navigator.of(context).pop();
                                  },
                                  child: Text("Edit"),
                                )
                              ],
                            );
                          },
                        ).then(
                              (value) {
                            setState(() {});
                          },
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      data[index].name,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CupertinoAlertDialog(
                                            title: Text("Confirm Delete"),
                                            content: Text(
                                                "Are you sure you want to delete ${data[index].name}?"),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text("Cancel"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                                onPressed: () async {
                                                  Navigator.of(context).pop();
                                                  await deleteUser(data[index].id);
                                                  setState(() {});
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),// Added some spacing
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Expanded( // Use Expanded to handle potentially long emails
                                    child: Text(
                                      "Email: ${data[index].email ?? 'N/A'}", // Display email or "N/A" if null
                                      style: TextStyle(color: Colors.orange, fontSize: 16),
                                      overflow: TextOverflow.ellipsis, // Handle long emails
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Text(
                                    "Phone: ${data[index].phoneNumber ?? 'N/A'}", // Display phone number or "N/A" if null
                                    style: TextStyle(color: Colors.purple, fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error fetching data: ${snapshot.error}"),
              );
            } else {
              return Center(
                child: Text("No data available."),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController nameController = TextEditingController();
              TextEditingController emailController = TextEditingController();
              TextEditingController phoneController = TextEditingController();

              return AlertDialog(
                title: Text("Add New User"),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: phoneController,
                        decoration: InputDecoration(labelText: 'Phone Number'),
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty) {
                        await addUSer(User(
                            id: "", // ID will be generated by backend
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text));
                        if (context.mounted) Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Name is required")),
                        );
                      }
                    },
                    child: Text("Add"),
                  )
                ],
              );
            },
          ).then(
                (value) {
              setState(() {});
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
