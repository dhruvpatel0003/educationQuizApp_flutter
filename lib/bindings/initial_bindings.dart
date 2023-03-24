import 'package:education_app/controllers/auth_controller.dart';
import 'package:education_app/controllers/theme_controller.dart';
import 'package:get/get.dart';

import '../services/firebase_storage_service.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
    Get.put(ZoomDrawerController());
  }
}
