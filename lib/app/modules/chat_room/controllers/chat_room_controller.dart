import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  late FocusNode focusNode;
  late TextEditingController chatC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void newChat(String email, Map<String, dynamic> argument, String chat) {
    CollectionReference chats = firestore.collection("chats");

    chats.doc(argument["chat_id"]).collection("chat").add({
      "pengirim": email,
      "penerima": argument["friendEmail"],
      "msg": chat,
      "time": DateTime.now().toIso8601String(),
      "isRead": false,
    });
  }

  @override
  void onInit() {
    chatC = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(() {});
    super.onInit();
  }

  @override
  void onClose() {
    chatC.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
