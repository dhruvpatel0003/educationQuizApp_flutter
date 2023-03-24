import 'package:education_app/controllers/auth_controller.dart';
import 'package:education_app/firebase_ref/references.dart';
import 'package:education_app/models/question_paper_model.dart';
import 'package:education_app/services/firebase_storage_service.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../screens/question/questions_screen.dart';


class QuestionPaperController extends GetxController{

  final allPaperImages = <String>[].obs;//reactive
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady(){//call after the bootup
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers()async{


    await Firebase.initializeApp();
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics"
    ];
    try{

      // print("above querysnapshot");
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();//object type of firebase cloud store
      // print(data);
      final paperList = data.docs.map((paper) => QuestionPaperModel.fromSnapShot(paper)).toList();
      allPapers.assignAll(paperList);


      for(var paper in paperList){
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl!;
        // print("inside controller");
        // print("img url"+imgUrl.toString());
        // allPaperImages.add(imgUrl!);
        // print("after allpaperImage");
      }
      allPapers.assignAll(paperList);
      print("Inside the allPaper question_paper_controller");
      print(allPapers);

    }catch(e){
      print(e);
    }
  }

  void navigateToQuestion({required QuestionPaperModel paper, bool tryAgain=false}){
    AuthController _authController = Get.find();
    if(_authController.isLoggedIn()){
      print(_authController.isLoggedIn());
      print("Inside navigateToQuestion authController");
      if(tryAgain){//make sure that really login or not

        Get.back();
        Get.toNamed(QuestionsScreen.routeName,arguments: paper,preventDuplicates: false);

      }else{
        print("U'r already logged In!");
        Get.toNamed(QuestionsScreen.routeName,arguments: paper);
      }
    }else{
      print("Inside else of naivgateQuestion");
      _authController.showLoginAlertDialogue();
    }
  }


}