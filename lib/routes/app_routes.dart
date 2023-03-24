import 'package:education_app/controllers/question_paper/question_paper_controller.dart';
import 'package:education_app/controllers/question_paper/questions_controller.dart';
import 'package:education_app/controllers/zoom_drawer_controller.dart';
import 'package:education_app/screens/home/home_screen.dart';
import 'package:education_app/screens/login/login_screen.dart';
import 'package:education_app/screens/question/test_overview.dart';
import 'package:education_app/screens/splash/splash_screen.dart';
import 'package:education_app/services/firebase_storage_service.dart';

import '../screens/introduction/introduction.dart';
import 'package:get/get.dart';

import '../screens/question/answer_check_screen.dart';
import '../screens/question/questions_screen.dart';
import '../screens/question/result_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/introduction", page: ()=> const AppIntroductionScreen()),
        GetPage(name: "/home", page: ()=>const HomeScreen(),
        binding: BindingsBuilder((){
          Get.put(QuestionPaperController());
          print("getting the drawer controller");
          Get.put(MyZoomDrawerController());
        //
        //   Get.put(FirebaseStorageService());
        })
        ),
    GetPage(name: LoginScreen.routeName, page: ()=>LoginScreen()),
    GetPage(name: QuestionsScreen.routeName, page: ()=>QuestionsScreen(),
    binding: BindingsBuilder((){
      Get.put<QuestionsController>(QuestionsController());
    })
    ),
    
    GetPage(name: TestOverviewScreen.routeName, page: ()=>const TestOverviewScreen()),
    GetPage(name: ResultScreen.routeName, page: ()=>const ResultScreen()),
    GetPage(name: AnswerCheckScreen.routeName, page: ()=>const AnswerCheckScreen()),

      ];
}
