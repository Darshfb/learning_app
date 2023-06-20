import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.textButton,
    required this.onTap,
    required this.buttonType,
  });

  final String textButton;
  final void Function() onTap;
  final String buttonType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 325.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: buttonType == "login"
                ? Colors.transparent
                : AppColors.primaryElementText,
          ),
            color: buttonType == "login"
                ? AppColors.primaryElement
                : AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1),
              )
            ]),
        child: Center(
            child: Text(
          textButton,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == "login"
                ? AppColors.primaryBackground
                : AppColors.primaryText,
          ),
        )),
      ),
    );
  }
}
