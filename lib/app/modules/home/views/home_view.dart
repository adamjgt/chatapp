import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:chatapp/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../chat_room/views/chat_room_view.dart';
import '../controllers/home_controller.dart';

import '../../../components/shadow_container.dart';

import '../../../components/constant.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/icons/chithcat icon 1.png"),
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: ShadowContainer(
                      height: (26.0),
                      width: (26.0),
                      color: kPrimaryColor,
                      child: InkWell(
                          onTap: () => authC.logout(),
                          child: Icon(Icons.close)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: (10.0),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.INTRODUCTION),
                  child: ShadowContainer(
                      alignment: Alignment.center,
                      color: kPrimaryColor,
                      height: (30.0),
                      child: const Text("Search")),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 2.0, bottom: 2.0, left: 10.0),
                        child: Container(
                          height: 649.0,
                          child: StreamBuilder<
                                  QuerySnapshot<Map<String, dynamic>>>(
                              stream: controller
                                  .chatStream(authC.user.value.email!),
                              builder: (context, snapshot1) {
                                if (snapshot1.connectionState ==
                                    ConnectionState.active) {
                                  var listDocsChats = snapshot1.data!.docs;
                                  print(listDocsChats);

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: listDocsChats.length,
                                    itemBuilder: (context, index) {
                                      return StreamBuilder<
                                          DocumentSnapshot<
                                              Map<String, dynamic>>>(
                                        stream: controller.friendStream(
                                            listDocsChats[index]["connection"]),
                                        builder: (context, snapshot2) {
                                          if (snapshot2.connectionState ==
                                              ConnectionState.active) {
                                            var data = snapshot2.data!.data();
                                            print(listDocsChats);

                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2,
                                                      vertical: 4),
                                              child: InkWell(
                                                onTap: () => Get.toNamed(
                                                    Routes.HOME,
                                                    arguments: {
                                                      "chat_id":
                                                          "${listDocsChats[index].id}",
                                                      "friendEmail":
                                                          listDocsChats[index]
                                                              ["connection"],
                                                    }),
                                                child: ShadowContainer(
                                                  height: 30.0,
                                                  width: 30.0,
                                                  child: data!["photoUrl"] ==
                                                          "noimage"
                                                      ? Image.asset(
                                                          "assets/icons/noimage.png",
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Image.network(
                                                          "${data["photoUrl"]}",
                                                          fit: BoxFit.cover,
                                                        ),
                                                  color: Colors.amber,
                                                ),
                                              ),
                                            );
                                          }
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      );
                                    },
                                  );
                                }
                                return Center(
                                    child: CircularProgressIndicator());
                              }),
                        ),
                      )),
                  ChatRoomView()
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
