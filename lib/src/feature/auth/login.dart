import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/routes/app_route_name.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/style/colors.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/auth/auth_controller.dart';
import 'package:provider/provider.dart';

import '../../core/widget/common_button.dart';
import '../../core/widget/common_text_field.dart';
import '../../core/widget/svg_icon.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 5),
                const Center(child: SvgIcon(SvgIcons.logo)),
                const Spacer(),
                const Text("Hello,",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30
                  ),
                ),
                const Text("Your are welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 40),
                Form(
                  key: controller.formKeyLogin,
                  child: Column(
                    children: [
                      CommonTextField(
                        onChanged: controller.emailTextFieldOnChanged,
                        validator: controller.emailValidator,
                        focusNode: controller.emailFocusNodeLogin,
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
                        focusNode: controller.passwordFocusNodeLogin,
                        controller: controller.passwordController,
                        labelText: "Password",
                        hintText: "Password",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 13
                      ),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: const TextStyle(color: AppColors.primaryGreen),
                          recognizer: TapGestureRecognizer()..onTap = (){
                            context.go(AppRouteName.register);
                          }
                        )
                      ]
                    ),
                  ),
                ),
                const Spacer(flex: 5),
                Consumer<AuthController>(
                  builder: (context, reg, child) {
                    return CommonButton(
                      text: "Sign in",
                      isLoading: reg.isLoadingLogin,
                      onPressed: () => reg.login(context),
                    );
                  }
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
