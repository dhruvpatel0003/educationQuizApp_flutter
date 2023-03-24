import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../firebase_ref/references.dart';


Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    // print("inside firebase");
    await Firebase.initializeApp();
    if (imgName == null) {
      // print("inside null block fss");
      return null;
    }
    try {
      // print("inside try block of firebasestorageService");
      // print("above urlref");
      // print("imgName"+imgName);
      // var urlRef = firebaseStorage.child("question_paper_images").child('${imgName.toLowerCase()}.png');
      var urlRef = await firebaseStorage.child("question_paper_images").child('${imgName.toLowerCase()}.png');
      ;
      // print("The provied urlRef"+urlRef.toString());
      // print("above imgUrl");
      var imgUrl = await urlRef.getDownloadURL();
      // print("after imgUrl");
      return imgUrl;
    } catch (e) {
      // print("inside catch block");
      print(e);
      return null;
    }
  }
}
