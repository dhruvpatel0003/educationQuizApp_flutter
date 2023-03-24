import 'package:education_app/controllers/question_paper/data_uploader.dart';
import 'package:education_app/firebase_ref/loading_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
   DataUploaderScreen({Key? key}) : super(key: key);

  DataUploader controller = Get.put(DataUploader());//controller is injected now we can use in this file

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Obx(() => Text(controller.loadingStatus.value==LoadingStatus.completed?"Complete Uploading":"Uploading")),
      ),
    );
  }
}
