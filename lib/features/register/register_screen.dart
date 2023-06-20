import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/widgets/custom_text_form_field.dart';
import 'package:learning_app/features/login/widgets/custom_login_text.dart';
import 'package:learning_app/features/login/widgets/login_button.dart';
import 'package:learning_app/features/login/widgets/login_text_field.dart';
import 'package:learning_app/features/login/widgets/sign_in_app_bar.dart';
import 'package:learning_app/features/register/bloc/register_bloc.dart';
import 'package:learning_app/features/register/bloc/register_states.dart';
import 'package:learning_app/features/register/register_controller.dart';

import '../../common/values/colors.dart';
import 'bloc/register_events.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(buttonType: "Register"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CustomLoginText(
                        text: "Or use your Email account to login"),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 36.h,
                    ),
                    padding: EdgeInsets.only(
                        left: 25.w, right: 25.w, top: 10.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 25.w, bottom: 15.w),
                          height: 25.h,
                          child: const CustomLoginText(
                              text:
                              "Enter your details below and free sign up"),
                        ),
                        const CustomLoginText(text: "User name"),
                        CustomTextFormField(
                          keyboardType: TextInputType.name,
                          controller: userNameController,
                          validatorText: "please Enter your name!",
                          prefixIcon: "user",
                          hintText: "Enter your name",
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(UserNameEvent(userName: userNameController.text));
                          },
                        ),
                        const CustomLoginText(text: "Email"),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validatorText: "please Enter your Email",
                          prefixIcon: "user",
                          hintText: "Enter your email address",
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(
                                EmailEvent(email: emailController.text));
                          },
                        ),
                        const CustomLoginText(text: "Password"),
                        CustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          validatorText: "please Enter your password!",
                          prefixIcon: "lock",
                          hintText: "Enter your password",
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(PasswordEvent(
                                password: passwordController.text));
                          },
                        ),
                        const CustomLoginText(text: "Confirm password"),
                        CustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: confirmPasswordController,
                          isValidate: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please Enter your password!";
                            }
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return "Password don't match";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: "lock",
                          hintText: "Enter your password",
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(
                                ConfirmPasswordEvent(
                                    confirmPassword:
                                    confirmPasswordController.text));
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25.w),
                          height: 25.h,
                          child: const CustomLoginText(
                              text:
                              "Enter your details below and free sign up"),
                        ),
                        LoginButton(
                          textButton: "Register",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              RegisterController(context: context).handleEmailRegister();
                            }
                          },
                          buttonType: 'login',
                        ),
                        LoginButton(
                          textButton: "Login",
                          onTap: () {
                            Navigator.pop(context);
                          },
                          buttonType: 'register',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
