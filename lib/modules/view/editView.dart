import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loocal_database/modules/controller/CreateController.dart';

class Edit extends StatefulWidget {
  const Edit({
    Key? key,
  }) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final controller = Get.put(CreateController());

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
              onPressed: controller.onSubmitCreate, child: Text("SUBMIT"))
        ],
      ),
    );
  }
}