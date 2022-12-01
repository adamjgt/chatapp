import 'package:get/get.dart';

class SearchController extends GetxController {
  // late TextEditingController searchC;

  // var queryAwal = [].obs;
  // var tempSearch = [].obs;

  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  // void searchFriend(String data) async {
  //   if (data.length == 0) {
  //     queryAwal.value = [];
  //     tempSearch.value = [];
  //   } else {
  //     var capitalized = data.substring(0, 1).toUpperCase() + data.substring(1);

  //     if (queryAwal.length == 0 && data.length == 1) {
  //       CollectionReference clients = await firestore.collection("clients");
  //       final keyNameResult = await clients
  //           .where("keyName", isEqualTo: data.substring(0, 1).toUpperCase())
  //           .get();

  //       if (keyNameResult.docs.length > 0) {
  //         for (int i = 0; i < keyNameResult.docs.length; i++) {
  //           queryAwal.add(keyNameResult.docs[i].data() as Map<String, dynamic>);
  //         }
  //       } else {
  //         print("Tidak ada Data");
  //       }
  //     }
  //     if (queryAwal.length != 0) {
  //       tempSearch.value = [];
  //       queryAwal.forEach((element) {
  //         if (element["name"].startWith(capitalized)) {
  //           tempSearch.add(element);
  //         }
  //       });
  //     }
  //   }
  // }

  @override
  void onInit() {
    // searchC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // searchC.dispose();
    super.onClose();
  }
}
