import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/values/constants.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/features/login/bloc/login_bloc.dart';
import 'package:learning_app/global.dart';

class LoginController {
  const LoginController({
    required this.context,
  });

  final BuildContext context;

  void handleLogin(String type) async {
    try {
      if (type == "email") {
        final state = context.read<LoginBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        debugPrint("in 0000password  $password Email");

        // if (emailAddress.isEmpty) {
        //   // todo:
        //   toastInfo(msg: "You need to fill your Email Address", backgroundColor: Colors.red,);
        // return;
        // }
        // if (password.isEmpty) {
        //   print("$password password");
        //   // todo:
        //   // toastInfo(msg: "You need to fill your password", backgroundColor: Colors.red,);
        //   return;
        // }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            // todo: User should login
            toastInfo(msg: "You don't exist", backgroundColor: Colors.red,);
            return;
          }
          if (!credential.user!.emailVerified) {
            // todo: user didn't verify
            toastInfo(msg: "You need to verify your email account", backgroundColor: Colors.red,);
            return;
          }

          var user = credential.user;
          if (user != null) {
       //      Global.storageService.saveData(key: AppConstants.userProfileKey, value: "${user.}")
            toastInfo(msg: "${user.displayName} Logged in successfully", backgroundColor: Colors.green,);
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.app, (route) => false);

            // todo: we got verified user from firebase
            return;
          }else{
            // todo: we have error getting user from firebase
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if(e.code == "user-not-found"){
            debugPrint("No User Found For this Email $e");
            toastInfo(msg: "No User Found For this Email", backgroundColor: Colors.red,);
          }else if (e.code == "wrong-password"){
            debugPrint("Wrong password provided for that user $e");
            toastInfo(msg: "Wrong password", backgroundColor: Colors.red,);
          }else if (e.code == "invalid-email"){
            debugPrint("Your email format is invalid $e");
            toastInfo(msg: "Your email format is invalid", backgroundColor: Colors.red,);
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
