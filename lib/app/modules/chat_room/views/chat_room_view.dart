import 'package:chatapp/app/controllers/auth_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/text_chat.dart';
import '../controllers/chat_room_controller.dart';

import '../../../components/shadow_container.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 14,
      child: Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 10.0),
        child: ShadowContainer(
          color: Colors.grey[350],
          height: (649.0),
          child: Column(
            children: [
              Expanded(
                flex: 30,
                child: Container(
                  color: Colors.grey[350],
                  child: ListView(
                    children: [
                      Text("${authC.user.value.name}"),
                      TextChat(
                        isSender: true,
                      ),
                      TextChat(
                        isSender: false,
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    children: [
                      ShadowContainer(
                        width: 30.5,
                        color: Colors.green,
                        child: Image.network("${authC.user.value.photoUrl}"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: "Write a text ...",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      )),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () => controller.newChat(
                              authC.user.value.email!,
                              Get.arguments as Map<String, dynamic>,
                              controller.chatC.text),
                          child: Icon(Icons.send))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
