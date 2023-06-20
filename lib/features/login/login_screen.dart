import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/widgets/custom_text_form_field.dart';
import 'package:learning_app/features/login/bloc/login_bloc.dart';
import 'package:learning_app/features/login/bloc/login_events.dart';
import 'package:learning_app/features/login/bloc/login_states.dart';
import 'package:learning_app/features/login/login_controller.dart';
import 'package:learning_app/features/login/widgets/custom_login_text.dart';
import 'package:learning_app/features/login/widgets/forgot_password.dart';
import 'package:learning_app/features/login/widgets/login_button.dart';
import 'package:learning_app/features/login/widgets/sign_in_app_bar.dart';
import 'package:learning_app/features/login/widgets/third_party_login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (BuildContext context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(
                  buttonType: "login"
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ThirdPartLogin(),
                    const Center(
                      child: CustomLoginText(
                          text: "Or use your Email account to login"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 36.h,
                      ),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomLoginText(text: "Email"),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validatorText: "please Enter your Email",
                            prefixIcon: "user",
                            hintText: "Enter your email address",
                            onChanged: (email) {
                              context
                                  .read<LoginBloc>()
                                  .add(EmailEvent(email: emailController.text));
                            },
                          ),
                          const CustomLoginText(text: "Password"),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            validatorText: "please Enter your password",
                            prefixIcon: "user",
                            hintText: "Enter your password",
                            onChanged: (password) {
                              context.read<LoginBloc>().add(PasswordEvent(password: passwordController.text));
                            },
                          ),
                          const ForgotPasswordWidget(),
                          LoginButton(
                            textButton: "LOGIN",
                            onTap: () {
                              LoginController(context: context).handleLogin("email");
                            },
                            buttonType: 'login',
                          ),
                          LoginButton(
                            textButton: "Register",
                            onTap: () {
                              Navigator.of(context).pushNamed(AppRoutes.registerScreen);
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
        );
      },
    );
  }
}
