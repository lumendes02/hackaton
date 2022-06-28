import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hackaton/lista/lista_access_modules.dart';
import 'package:hackaton/lista/respostas_access_modules.dart';
import '/home_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => HomePage(),
        ),
        ListaAccessModule(),
        respostasAccessModule(),
      ],
    );
  }
}
