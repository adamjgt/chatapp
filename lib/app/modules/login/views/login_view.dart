import 'package:chatapp/app/controllers/auth_controller.dart';

import 'package:flutter/material.dart';

import 'package:searchfield/searchfield.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  final listw =
      ['KONTOL'].map((e) => SearchFieldListItem(e, child: Text(e))).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => authC.login(),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SearchField(suggestions: listw)
          ],
        ),
      ),
    );
  }
}
