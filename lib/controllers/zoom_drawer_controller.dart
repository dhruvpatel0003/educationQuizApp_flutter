import 'package:education_app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';


class MyZoomDrawerController extends GetxController{

  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer(){
    // print("toogleDrawer class");
        zoomDrawerController.toggle?.call();
        update();
  }

  void signOut(){
    Get.find<AuthController>().signOut();
  }

  void signIn(){

  }

  void website(){
      _launch("https://www.google.com");
  }

  void facebook(){
      _launch("https://www.facebook.com");
  }

  void email(){

    final Uri emailLaunchUri = Uri(
      scheme: "mailto",
      path: "practice0003@gmail.com"
    );

    _launch(emailLaunchUri.toString());


  }

  Future<void> _launch(String url) async {

      if(!await launch(url)){
        throw "could not processing : $url";
      }



  }

}