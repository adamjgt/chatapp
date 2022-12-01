import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(135),
          child: AppBar(
            backgroundColor: Colors.red[900],
            title: Text('Search'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back),
            ),
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextField(
                  onChanged: (value) => controller.searchFriend(
                    value,
                    authC.user.value.email!,
                  ),
                  controller: controller.searchC,
                  cursorColor: Colors.red[900],
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    hintText: "Search a new friend here...",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.search,
                          color: Colors.red[900],
                        )),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Obx(() => controller.tempSearch.length == 0
            ? Center(
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.7,
                  height: Get.height * 0.7,
                  child: Text(
                    "Mau Chat Siapa Broo??",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.tempSearch.length,
                itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black26,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: controller.tempSearch[index]["photoUrl"] ==
                                  "noimage"
                              ? Image.asset(
                                  "assets/icons/noimage.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  controller.tempSearch[index]["photoUrl"],
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      title: Text(
                        "${controller.tempSearch[index]["name"]}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "${controller.tempSearch[index]["email"]}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      trailing: GestureDetector(
                        onTap: () => authC.addNewCollection(
                            controller.tempSearch[index]["email"]),
                        child: Chip(label: Text("Message")),
                      ),
                    ))));
  }
}
