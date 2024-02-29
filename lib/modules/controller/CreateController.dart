import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loocal_database/models/note.dart';
import 'package:loocal_database/modules/controller/HomeController.dart';

class CreateController extends GetxController {
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  final HomePageController homePageController = Get.put(HomePageController());

  void onSubmit(Note note) {
    if (titleController.text.trim().isNotEmpty &&
        contentController.text.trim().isNotEmpty) {
      Get.back(
        result: Note(
          title: titleController.text,
          content: contentController.text,
          id: note.id,
        ),
      );
    }
  }

  void onSubmitCreate() {
    if (titleController.text.trim().isNotEmpty &&
        contentController.text.trim().isNotEmpty) {
      Get.back(
        result: Note(
          title: titleController.text,
          content: contentController.text,
        ),
      );
    }
  }
}
