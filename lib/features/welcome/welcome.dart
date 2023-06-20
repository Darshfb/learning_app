import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/features/welcome/bloc/welcome_bloc.dart';
import 'package:learning_app/features/welcome/bloc/welcome_events.dart';
import 'package:learning_app/features/welcome/bloc/welcome_states.dart';
import 'package:learning_app/features/welcome/widgets/screen_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeStates>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: controller,
                    onPageChanged: (index){
                       state.page = index;
                       BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvents());
                      debugPrint("Index value is $index");

                    },
                    children: [
                      WelcomePage(
                          index: state.page,
                          controller : controller,
                          buttonName: "Next",
                          title: "First See Learning",
                          subTitle:
                              "Forget about for a paper all knowledge good learning",
                          imagePath: "assets/images/reading.png"),
                      WelcomePage(
                          index: state.page,
                          controller : controller,
                          buttonName: "Next",
                          title: "Connect with EveryOne",
                          subTitle:
                              "Always keep in touch with your tutor & friends, lets get connected",
                          imagePath: "assets/images/boy.png"),
                      WelcomePage(
                          index: state.page,
                          controller : controller,
                          buttonName: "Get Started",
                          title: "Always fascinated learning",
                          subTitle:
                              "Anywhere, anytime. The time is at our discription, so study whenever you want",
                          imagePath: "assets/images/man.png"),
                    ],
                  ),
                  Positioned(
                    bottom: 30.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: AppColors.primaryThirdElementText,
                          activeColor: AppColors.primaryElement,
                          size: const Size.square(8.0),
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0.w),
                          )),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
