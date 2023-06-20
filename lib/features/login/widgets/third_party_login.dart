import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/features/login/widgets/login_social_icons.dart';

class ThirdPartLogin extends StatelessWidget {
  const ThirdPartLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 48.h,
        bottom: 20.h,
      ),
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LoginSocialIcons(image: "assets/icons/google.png", onTap: () {}),
          LoginSocialIcons(
            image: "assets/icons/apple.png",
            onTap: () {},
          ),
          LoginSocialIcons(
            image: "assets/icons/facebook.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
