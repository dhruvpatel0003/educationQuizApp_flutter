import 'package:education_app/firebase_ref/references.dart';
import 'package:education_app/screens/home/home_screen.dart';
import 'package:education_app/screens/login/login_screen.dart';
import 'package:education_app/widgets/dialogs/dialogue_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '';


class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
  late FirebaseAuth _auth;


  void initAuth() async {
    // await Firebase.initializeApp();
    await Future.delayed(const Duration(seconds: 2));
    print("Before _auth");

    _auth = await FirebaseAuth.instance;
    // final _auth = FirebaseAuth.instance;
    print("After the _auth");
    _authStateChanges =
        _auth.authStateChanges(); //check the user connected or not
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  signInWithGoogle() async {
    // final _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn =
        await GoogleSignIn(); //get the information to the google
    try {
      print("Inside try block");
      GoogleSignInAccount? account = await googleSignIn.signIn();
      print("after googleSignInAccount");
      if (account != null) {
        print("Account information: " + account.toString());
        final _authAccount = await account.authentication; //get the information if that the email id is exist
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);
        print("Credential : $_credential");

        print("Above the signinwithecredential");
        await _auth.signInWithCredential(_credential);
        print("Above the saveuser account");
        await saveUser(account);
        print("After the saveUser into the account");
        navigateToHomePage();
      }
    } catch (e) {
      print(e);
    }
  }

  User? getUser(){
    // final _auth = FirebaseAuth.instance;
    _user.value = _auth.currentUser;
    print("Inside getUser : ${_user.value}");
    return _user.value;
  }


  saveUser(GoogleSignInAccount account) {
    print("inside the saveUser function");
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilePic": account.photoUrl
    });
  }

  Future<void> signOut() async {
      try{
        await _auth.signOut();
        print("from signout function : SignOut successfully");
        navigateToHomePage();
      }catch(e){
        print("Error in signOut : $e");
      }
  }



  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  void showLoginAlertDialogue() {
    print("Inside the showLoginAlertDialoug - auth_controller");
    Get.dialog(
        Dialogs().questionStartDialogue(onTap: () {
          Get.back();
          navigateToLoginPage();
        }),
        barrierDismissible: false);
  }

  void navigateToLoginPage() {

      Get.toNamed(LoginScreen.routeName);
  }

  navigateToHomePage(){
    Get.offAllNamed(HomeScreen.routeName);
  }


  bool isLoggedIn() {
    final _auth = FirebaseAuth.instance;
    print("inside loggedIn");
    print("Status : " + (_auth.currentUser != null).toString());
    // print("After the _authcurrentUser in auth_controller");
    return _auth.currentUser != null;
  }
}
