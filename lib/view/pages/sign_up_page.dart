import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/auth_controller.dart';
import 'package:trademanager/view/widgets/authentication/custom_text_field.dart';
import 'package:trademanager/view/widgets/authentication/sign_in_switch_button.dart';
import 'package:trademanager/view/widgets/authentication/sign_up_text.dart';
import 'package:trademanager/view/widgets/authentication/sign_up_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final ctrl = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                signUpText(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    CustomAuthTextField(
                      hintText: 'email',
                      controller: ctrl.isSignUpPage.value
                          ? ctrl.email
                          : ctrl.loginEmail,
                    ),
                    const SizedBox(height: 10),
                    CustomAuthTextField(
                        hintText: 'password',
                        controller: ctrl.isSignUpPage.value
                            ? ctrl.password
                            : ctrl.loginPassword,
                        isPassword: true),
                    const SizedBox(height: 5),
                    signUpButton(context),
                    switchToSignInPage()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
