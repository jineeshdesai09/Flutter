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
      backgroundColor: Colors.grey[100], // Light grey background for the whole page
      appBar: AppBar(
        elevation: 2, // Add a slight shadow to the app bar
        backgroundColor: Colors.greenAccent[400], // Slightly brighter greenAccent
        title: Padding( // Reduced margin for title for better balance
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            "User Data from API", // More descriptive title
            style: TextStyle(
              color: Colors.white,
              fontSize: 24, // Slightly smaller, more modern size
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center, // Ensure title is centered
          ),
        ),
        centerTitle: true, // Center the title in AppBar
        shape: RoundedRectangleBorder( // More subtle rounded bottom corners for AppBar
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: FutureBuilder<List<User>>( // Explicitly type FutureBuilder for better readability
          future: getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator()); // Center loading indicator
            } else if (snapshot.hasData) {
              List<User> data = snapshot.data!.reversed.toList().cast<User>();
              return ListView.builder(
                padding: const EdgeInsets.all(8), // Add some padding around the list
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final user = data[index]; // Use final for user for clarity
                  return Card(
                    elevation: 3, // Slightly increased elevation for more depth
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // More balanced card margins
                    shape: RoundedRectangleBorder( // Rounded corners for cards
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0), // Increased padding inside card
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center, // Align icon and name vertically
                            children: [
                              Icon(
                                Icons.person_rounded, // More modern person icon
                                color: Colors.blueGrey[700], // Muted grey-blue for icon
                                size: 32, // Slightly reduced icon size
                              ),
                              SizedBox(width: 12), // Increased spacing after icon
                              Expanded(
                                child: Text(
                                  user.name,
                                  style: TextStyle(
                                    color: Colors.blueGrey[900], // Darker text for name
                                    fontWeight: FontWeight.w700, // Slightly less bold, but still strong
                                    fontSize: 22, // Adjusted font size
                                  ),
                                ),
                              ),
                              IconButton(
                                tooltip: 'Delete User', // Added tooltip for accessibility
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: Text("Confirm Delete"),
                                        content: Text(
                                            "Are you sure you want to delete ${user.name}?"),
                                        actions: <Widget>[
                                          CupertinoDialogAction( // Using CupertinoDialogAction for consistent styling in AlertDialog
                                            child: Text("Cancel"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          CupertinoDialogAction(
                                            isDestructiveAction: true, // Marks as destructive action (red text)
                                            child: Text("Delete"),
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              await deleteUser(user.id);
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.delete_rounded, color: Colors.red[600]), // More modern delete icon and color
                              ),
                            ],
                          ),
                          SizedBox(height: 12), // Increased spacing below name row
                          // Email Row
                          Padding( // Added padding for consistent alignment
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Icon(Icons.email_rounded, color: Colors.orange[700], size: 20), // Modern email icon
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "Email: ${user.email ?? 'N/A'}",
                                    style: TextStyle(color: Colors.orange[800], fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Phone Row
                          Padding( // Added padding for consistent alignment
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Icon(Icons.phone_rounded, color: Colors.purple[700], size: 20), // Modern phone icon
                                SizedBox(width: 8),
                                Text(
                                  "Phone: ${user.phoneNumber ?? 'N/A'}",
                                  style: TextStyle(color: Colors.purple[800], fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error fetching data: ${snapshot.error}", style: TextStyle(color: Colors.red)), // Error text in red
              );
            } else {
              return Center(
                child: Text("No data available."),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent[400], // Consistent FAB color
        tooltip: 'Add New User', // Added tooltip for accessibility
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController nameController = TextEditingController();
              TextEditingController emailController = TextEditingController();
              TextEditingController phoneController = TextEditingController();

              return AlertDialog(
                title: Text("Add New User", style: TextStyle(fontWeight: FontWeight.w600)), // Slightly bolder title
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), // Rounded border
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton( // Using TextButton for a more modern dialog button style
                    onPressed: () {
                      Navigator.of(context).pop(); // Cancel button to just close dialog
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom( // Style for Add button to match theme
                      backgroundColor: Colors.greenAccent[400],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () async {
                      if (nameController.text.isNotEmpty) {
                        await addUSer(User(
                            id: "",
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text));
                        if (context.mounted) Navigator.of(context).pop();
                        setState(() {}); // Refresh the list after adding
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Name is required")),
                        );
                      }
                    },
                    child: Text("Add"),
                  ),
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