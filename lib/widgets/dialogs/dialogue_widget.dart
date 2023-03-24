import 'package:flutter/material.dart';

class Dialogs{
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs(){
    return _singleton;//singleton = only one instance of class exsits
  }

  Widget questionStartDialogue({required VoidCallback onTap}){
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
           Text(
             "Education App says, ",style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 25
           ),
           ),
          Text("Login to proceed further 😁"),
        ],
      ),
      actions:[
        TextButton(onPressed: onTap, child: Text("Confirm"))
      ]
    );
  }

}