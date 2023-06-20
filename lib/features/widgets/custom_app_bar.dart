import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar({
  required String menu,
  required String lastIcon,
}) {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(
        left: 7.w,
        right: 7.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset(menu),
          ),
          GestureDetector(
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(lastIcon))),
            ),
          )
        ],
      ),
    ),
  );
}
