import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSocialIcons extends StatelessWidget {
  const LoginSocialIcons({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
  final void Function() onTap;

// final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset(image),
      ),
    );
  }
}
