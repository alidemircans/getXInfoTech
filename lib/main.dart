import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstarted/view/pages/home/view/home_view.dart';

import 'viewmodel/api_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiViewModel apiViewModel = Get.put(ApiViewModel());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeViewPage(),
    );
  }
}
