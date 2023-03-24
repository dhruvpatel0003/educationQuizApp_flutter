import "dart:convert";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:education_app/firebase_ref/loading_status.dart";
import "package:education_app/firebase_ref/references.dart";
import "package:education_app/models/question_paper_model.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";

class DataUploader extends GetxController{

  @override
  void onReady(){//calls only once. To upload data on firebase
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;//loadingStatus is obeservable, value changes UI observe that

  Future<void> uploadData() async{

    loadingStatus.value = LoadingStatus.loading;//value is 0

    final fireStore = FirebaseFirestore.instance;//create the instance

    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");//target the assets in yaml file
    // print(manifestContent);
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);//o->string or list
    // print(manifestMap);
    final paperInAssets = manifestMap.keys.where((path)=>path.startsWith("assets/papers/")&&path.contains(".json")).toList();//just load the json paper path
    // print(paperInAssets);
    List<QuestionPaperModel> questionPapers = [];
    for(var paper in paperInAssets){
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));//decode - take a string and convert it into the map
      // print(stringPaperContent);
    }
    // print(questionPapers.length);
    var batch = fireStore.batch();//group multiple operations together and execute them as a single unit of work

    for(var paper in questionPapers){
      batch.set(questionPaperRF.doc(paper.id),{
        "title" : paper.title,
        "image_url":paper.imageUrl,
        "Description":paper.description,
        "time_seconds":paper.timeSeconds,
        "question_count":paper.questions==null?0:paper.questions!.length
      });

      for(var questions in paper.questions!){
         final questionPath = questionRF(paperId: paper.id, questionId: questions.id);
         batch.set(questionPath, {
           "questions":questions.question,
           "correct_answer":questions.correctAnswer
         });
          // print(questionPath);
         for(var answer in questions.answers){
           batch.set(questionPath.collection("answers").doc(answer.identifier),
               {
                 "identifier":answer.identifier,
                 "Answer":answer.answer
               });
         }

    }


  }
    await batch.commit();

    loadingStatus.value = LoadingStatus.completed;//value = 1

}}

