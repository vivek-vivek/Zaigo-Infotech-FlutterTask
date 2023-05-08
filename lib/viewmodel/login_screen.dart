// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:zaigo_infotech_flutter_task/res/constants.dart';
import 'package:zaigo_infotech_flutter_task/utils/custom_colors.dart';

import '../widgets/login_button.dart';
import '../widgets/textform_feilds.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: kBlack,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PhoneNumberFeild(),
              const SizedBox(height: 20),
              const PasswordFeild(),
              kHeight30,
              kHeight30,
              LoginButton(formKey: formkey),
            ],
          ),
        ),
      ),
    );
  }
}
