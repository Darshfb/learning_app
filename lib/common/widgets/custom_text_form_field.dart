import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.keyboardType,
    this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.validatorText,
    this.onChanged,
    this.textType = "",
    this.onComplete,
    this.validator,
    this.isValidate = false,
  });

  final TextInputType keyboardType;
  final String? prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final String? validatorText;
  final void Function(String)? onChanged;
  final String? textType;
  final void Function()? onComplete;
  final bool? isValidate;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: textType == "password" ? true : false,
      controller: controller,
      validator: !isValidate!
          ? (value) {
              if (value!.isEmpty) {
                return validatorText;
              } else {
                return null;
              }
            }
          : validator,
      onChanged: onChanged,
      onEditingComplete: onComplete,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
        prefixIcon: prefixIcon != null
            ? Image.asset(
                "assets/icons/$prefixIcon.png",
                width: 10.0,
                height: 10.0,
              )
            : null,
        hintText: hintText,
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
    );
  }
}
