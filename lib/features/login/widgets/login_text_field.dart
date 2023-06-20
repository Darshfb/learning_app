import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key,
      required this.text,
      required this.textType,
      required this.iconName,
      required this.hintText,
      required this.onChanged});

  final String text;
  final String textType;
  final String iconName;
  final String hintText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: AppColors.primaryFourthElementText,
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              width: 16.w,
              height: 16.w,
              margin: EdgeInsets.only(left: 17.w),
              child: Image.asset("assets/icons/$iconName.png"),
            ),
            SizedBox(
              width: 270.w,
              height: 50.h,
              child: TextField(
                onChanged: onChanged,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
                autocorrect: false,
                obscureText: textType == "password" ? true : false,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget last(){
  return TextFormField(
    onChanged: (value){},
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
      contentPadding:  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
      prefixIcon: Image.asset("assets/icons/user.png", width: 10.0, height: 10.0,),
      hintText: "hintText",
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w),
          borderSide: const BorderSide(
            color: AppColors.primaryFourthElementText,
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w),
          borderSide: const BorderSide(
            color: AppColors.primaryFourthElementText,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w),
          borderSide: const BorderSide(
            color: AppColors.primaryFourthElementText,
          )),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w),
          borderSide: const BorderSide(
            color: AppColors.primaryFourthElementText,
          )),
      hintStyle: const TextStyle(
        color: AppColors.primarySecondaryElementText,
      ),
    ),
    style: TextStyle(
      color: AppColors.primaryText,
      fontFamily: "Avenir",
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
    ),
    autocorrect: false,
    obscureText: false,
  );
}
