import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:chatapp/app/modules/splash/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Obx(
              () => GetMaterialApp(
                title: "ChitChat",
                initialRoute: authC.isAuth.isTrue ? Routes.HOME : Routes.LOGIN,
                getPages: AppPages.routes,
              ),
            );
          }
          return FutureBuilder(
              future: authC.firstInitialized(),
              builder: (context, snapshot) => SplashView());
        });
  }
}
