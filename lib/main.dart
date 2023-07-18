import 'package:flutter/material.dart';
import 'package:fudge_finance/controllers/usercontroller.dart';
import 'package:fudge_finance/views/home.dart';
import 'package:get/get.dart';

void main() {
  Get.put(UserController());
  runApp(MaterialApp(
    title: 'Fudge Finance Application',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomeView(),
  ));
}
