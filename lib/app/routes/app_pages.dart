import 'package:get/get.dart';

import 'package:chatapp/app/modules/chat_room/bindings/chat_room_binding.dart';
import 'package:chatapp/app/modules/chat_room/views/chat_room_view.dart';
import 'package:chatapp/app/modules/error/bindings/error_binding.dart';
import 'package:chatapp/app/modules/error/views/error_view.dart';
import 'package:chatapp/app/modules/home/bindings/home_binding.dart';
import 'package:chatapp/app/modules/home/views/home_view.dart';
import 'package:chatapp/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:chatapp/app/modules/introduction/views/introduction_view.dart';
import 'package:chatapp/app/modules/loading/bindings/loading_binding.dart';
import 'package:chatapp/app/modules/loading/views/loading_view.dart';
import 'package:chatapp/app/modules/login/bindings/login_binding.dart';
import 'package:chatapp/app/modules/login/views/login_view.dart';
import 'package:chatapp/app/modules/search/bindings/search_binding.dart';
import 'package:chatapp/app/modules/search/views/search_view.dart';
import 'package:chatapp/app/modules/splash/bindings/splash_binding.dart';
import 'package:chatapp/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOADING,
      page: () => LoadingView(),
      binding: LoadingBinding(),
    ),
    GetPage(
      name: _Paths.ERROR,
      page: () => ErrorView(),
      binding: ErrorBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
