// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaigo_infotech_flutter_task/utils/authentication.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/login_provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});

  final formKey;
  @override
  Widget build(BuildContext context) {
    final loginState = context.watch<LoginProvider>();
    return InkWell(
      onTap: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();

          Authentication().loginUser(context);
        }
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: Colors.tealAccent, spreadRadius: 2)
          ],
          color: Colors.lightGreenAccent..withOpacity(.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: loginState.loadingState
              ? const CircularProgressIndicator()
              : const Text("Login"),
        ),
      ),
    );
  }
}
