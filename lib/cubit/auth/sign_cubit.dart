import 'package:block_cubit/cubit/auth/sign_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/auth_service.dart';
import '../../models/universal_data.dart';
import '../../utils/ui_utils/loading_dialog.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.firebaseServices}) : super(SignUpState(email: '', password: ''));
  final AuthService firebaseServices;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isLoading = false;


  buttonPressed() {
    passwordController.clear();
    emailController.clear();
  }

  Future<void> signUpUser(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
    showLoading(context: context);
    UniversalData universalData =
    await firebaseServices.signUpUser(email: email, password: password);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }


    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, "User signed Up");
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();

  Future<void> logInUser(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
    showLoading(context: context);
    UniversalData universalData =
    await firebaseServices.loginUser(email: email, password: password);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }


    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, "User Logged in");
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  Future<void> logOutUser(BuildContext context) async {
    showLoading(context: context);
    UniversalData universalData = await firebaseServices.logOutUser();
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showMessage(context, universalData.data as String);
      }
    } else {
      if (context.mounted) {
        showMessage(context, universalData.error);
      }
    }
  }

  showMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }
}