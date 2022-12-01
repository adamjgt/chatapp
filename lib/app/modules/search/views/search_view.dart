import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
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
                  // controller: controller.searchC,
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
        body: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black26,
                    child: Text("DATA"),
                  ),
                  title: Text(
                    "Orang ke ${index + 1}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  trailing: GestureDetector(
                    onTap: () => Get.toNamed(Routes.HOME),
                    child: Chip(label: Text("Message")),
                  ),
                )));
  }
}
