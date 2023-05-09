import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/login_provider.dart';

import '../utils/custom_colors.dart';

class PhoneNumberFeild extends StatelessWidget {
  const PhoneNumberFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: const BoxDecoration(
          color: Colors.tealAccent,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextFormField(
        controller: Provider.of<LoginProvider>(context).phone,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a mobile number';
          } else if (value.length > 10 || value.length < 10) {
            return 'Please enter a valid mobile number';
          }
          return null;
        },
        onChanged: (value) => log(value.toString()),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.phone),
            border: InputBorder.none,
            hintText: "Phone Number"),
      ),
    );
  }
}

class PasswordFeild extends StatelessWidget {
  const PasswordFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: const BoxDecoration(
          color: Colors.tealAccent,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextFormField(
        onChanged: (value) => log(value.toString()),
        obscureText: true,
        controller: Provider.of<LoginProvider>(context).password,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outline_rounded),
          border: InputBorder.none,
          hintText: "Password",
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              // value.passwordVisible
              //     ? Icons.visibility_off
              //     :
              Icons.visibility,
              color: kBlack,
            ),
          ),
        ),
      ),
    );
  }
}
