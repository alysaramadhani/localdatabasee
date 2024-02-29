import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loocal_database/models/note.dart';
import 'package:loocal_database/modules/controller/HomeController.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Colors.purple, // Warna latar belakang App Bar
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.createNote,
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple, // Warna latar belakang FAB
      ),
      body: SafeArea(
        child: Obx(
              () => controller.isLoading.value
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.notes.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3, // Elevasi kartu
                margin: const EdgeInsets.all(8), // Ruang antar kartu
                child: ListTile(
                  title: Text(controller.notes[index].title),
                  subtitle: Text(controller.notes[index].content),
                  trailing: PopupMenuButton(
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                          child: Text("Edit"),
                          onTap: () {
                            controller.updateNote(
                              Note(
                                  id: controller.notes[index].id,
                                  title: controller.notes[index].title,
                                  content:
                                  controller.notes[index].content),
                            );

                            print(
                              controller.notes[index].id,
                            );
                            print(
                              controller.notes[index].title,
                            );
                            print(controller.notes[index].content);
                          }),
                      PopupMenuItem(
                        child: Text("Delete"),
                        onTap: () => controller
                            .deleteNotes(controller.notes[index].id!),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
