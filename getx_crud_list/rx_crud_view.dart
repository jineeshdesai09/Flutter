import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/rx_crud_controller.dart';
import '../model/rx_crud_model.dart';

void main() => runApp(const RxCrudApp());

class RxCrudApp extends StatelessWidget {
  const RxCrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RxCrudView(),
    );
  }
}

class RxCrudView extends StatelessWidget {
  const RxCrudView({super.key});

  @override
  Widget build(BuildContext context) {
    final RxCrudController controller = Get.put(RxCrudController());
    final TextEditingController inputController = TextEditingController();
    final TextEditingController editController = TextEditingController();

    void showEditDialog(int index) {
      editController.text = controller.students[index].name;
      Get.defaultDialog(
        title: "Edit Name",
        content: TextField(
          controller: editController,
          decoration: const InputDecoration(labelText: "Enter new name"),
        ),
        textConfirm: "Update",
        textCancel: "Cancel",
        onConfirm: () {
          controller.updateItem(index, editController.text);
          Get.back();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rx CRUD with GetX"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: const InputDecoration(
                      labelText: "Enter Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    controller.addItem(inputController.text);
                    inputController.clear();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.students.length,
                itemBuilder: (context, index) {
                  final RxCrudModel item = controller.students[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => showEditDialog(index),
                          ),
                          IconButton(
                            icon: Icon(
                              item.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: item.isFavorite ? Colors.red : null,
                            ),
                            onPressed: () => controller.toggleFavorite(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.black54),
                            onPressed: () => controller.deleteItem(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
