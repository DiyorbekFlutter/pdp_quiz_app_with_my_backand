import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/style/colors.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/auth/auth_controller.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_route_name.dart';
import '../../core/widget/common_button.dart';
import '../../core/widget/common_text_field.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const SizedBox(height: 64),
          const Text("Create an account",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          const Text(
            "Let’s help you set up your account,\nit won’t take long.",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400
            ),
          ),
          const SizedBox(height: 80),
          Form(
            key: controller.formKeyRegister,
            child: Column(
              children: [
                CommonTextField(
                  validator: controller.firstnameValidator,
                  textInputAction: TextInputAction.next,
                  controller: controller.firstNameController,
                  hintText: "Enter First Name",
                  labelText: "First Name",
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  validator: controller.lastnameValidator,
                  controller: controller.lastNameController,
                  hintText: "Enter Last Name",
                  labelText: "Last Name",
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  onChanged: controller.emailTextFieldOnChanged,
                  validator: controller.emailValidator,
                  focusNode: controller.emailFocusNodeRegister,
                  controller: controller.emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  hintText: "example@gmail.com",
                ),
                const SizedBox(height: 25),
                CommonTextField(
                  validator: controller.passwordValidator,
                  textInputAction: TextInputAction.done,
                  focusNode: controller.passwordFocusNodeRegister,
                  controller: controller.passwordController,
                  labelText: "Password",
                  hintText: "Password",
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Consumer<AuthController>(
            builder: (context, ref, child) {
              return CheckboxListTile(
                dense: true,
                isError: !ref.isPrivacyPolicyChecked && ref.isChecking,
                activeColor: Colors.blue,
                value: ref.isPrivacyPolicyChecked,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  "Accept terms & Condition",
                  style: TextStyle(
                    color: ref.isPrivacyPolicyChecked
                        ? AppColors.black
                        : const Color(0xffD9D9D9)
                  )
                ),
                onChanged: ref.checkIsPrivacyPolicyChecked
              );
            }
          ),
          const SizedBox(height: 20),
          Consumer<AuthController>(
            builder: (context, ref, child) {
              return CommonButton(
                text: "Davom etish",
                isLoading: ref.isLoadingRegister,
                onPressed: () => ref.register(context),
              );
            }
          ),
          const SizedBox(height: 60),
          Center(
            child: RichText(
              text: TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),
                  children: [
                    TextSpan(
                        text: "Sign In",
                        style: const TextStyle(color: AppColors.primaryGreen),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          context.go(AppRouteName.login);
                        }
                    )
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
