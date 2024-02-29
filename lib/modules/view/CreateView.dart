import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loocal_database/models/note.dart';
import 'package:loocal_database/modules/controller/CreateController.dart';

class Create extends StatefulWidget {
  final Note? note;
  const Create({Key? key, this.note}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final controller = Get.put(CreateController());

  @override
  void initState() {
    super.initState();
    controller.titleController.text = widget.note!.title;
    controller.contentController.text = widget.note!.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: controller.titleController,
            decoration: InputDecoration(
                labelText: "Title", border: OutlineInputBorder()),
          ),
          TextField(
            controller: controller.contentController,
            decoration: InputDecoration(
                labelText: "Content", border: OutlineInputBorder()),
          ),
          Spacer(),
          ElevatedButton(
              onPressed: () {
                controller.onSubmit(Note(
                    title: controller.titleController.text,
                    content: controller.contentController.text,
                    id: widget.note!.id));
              },
              child: Text("SUBMIT"))
        ],
      ),
    );
  }
}
