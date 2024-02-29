import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loocal_database/db/db_helper.dart';
import 'package:loocal_database/modules/controller/HomeController.dart';
import 'package:loocal_database/modules/view/HomeView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => Home()),
        ],
      ),
    );
  }
}
