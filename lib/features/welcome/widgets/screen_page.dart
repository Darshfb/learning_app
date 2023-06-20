import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/common/values/constants.dart';
import 'package:learning_app/global.dart';

class WelcomePage extends StatefulWidget {
   const WelcomePage(
      {Key? key,
      required this.index,
      required this.buttonName,
      required this.title,
      required this.subTitle,
      required this.imagePath,
      required this.controller})
      : super(key: key);
  final int? index;
  final String buttonName;
  final String title;
  final String subTitle;
  final String imagePath;
  final PageController controller;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            widget.subTitle,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            /// Within 0 - 2 index
            if (widget.index! < 2) {
              // animation
              // widget.index +1;
              widget.controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const HomeScreen()), (route) => false);
              Global.storageService.saveData(key: AppConstants.deviceFirstOpen, value: true);
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginRoute, (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                widget.buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
