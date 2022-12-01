import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Container(
          alignment: Alignment.center,
          width: 400,
          height: 400,
          child: Text(
            "KONTOL",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        )),
      ),
    );
  }
}
