import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/service/storage_service.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/features/app/bloc/app_bloc.dart';
import 'package:learning_app/features/app/bloc/app_events.dart';
import 'package:learning_app/features/app/bloc/app_states.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("mostafa");

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<AppBloc, AppState>(
            buildWhen: (previous, current) {
              if (current != previous) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              return state.screens[state.index];
              // return context
              //     .read<AppCubit>()
              //     .screens[context.read<AppCubit>().currentIndex];
            },
          ),
          bottomNavigationBar:
              BlocBuilder<AppBloc, AppState>(builder: (context, state) {
            return Container(
              width: 375.w,
              height: 85.h,
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1
                  )
                ]
              ),
              child: BottomNavigationBar(
                elevation: 0,
                currentIndex: state.index,
                onTap: (index) {
                  context.read<AppBloc>().add(ChangeBottomNavBarEvent(index));
                  // context.read<AppCubit>().changeBottomNavBar(index: index);
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourthElementText,
                items: [
                  BottomNavigationBarItem(
                      label: "Home",
                      tooltip: "Home",
                      icon: SizedBox(
                          height: 15.h,
                          width: 15.h,
                          child: Image.asset("assets/icons/home.png")),
                      activeIcon: SizedBox(
                          height: 15.h,
                          width: 15.h,
                          child: Image.asset(
                            "assets/icons/home.png",
                            color: AppColors.primaryElement,
                          ))),
                  BottomNavigationBarItem(
                      label: "Search",
                      tooltip: "Search",
                      icon: SizedBox(
                          height: 15.h,
                          width: 15.h,
                          child: Image.asset("assets/icons/search2.png")),
                      activeIcon: SizedBox(
                          height: 15.h,
                          width: 15.h,
                          child: Image.asset(
                            "assets/icons/search2.png",
                            color: AppColors.primaryElement,
                          ))),
                  BottomNavigationBarItem(
                      label: "Course",
                      tooltip: "Course",
                      icon: SizedBox(
                          height: 15.h,
                          width: 15.h,
                          child: Image.asset("assets/icons/play-circle1.png")),
                      activeIcon: SizedBox(
                          height: 15.h,
                          width: 15.h,
                          child: Image.asset(
                            "assets/icons/play-circle1.png",
                            color: AppColors.primaryElement,
                          ))),
                  BottomNavigationBarItem(
                      label: "Chat",
                      tooltip: "Chat",
                      icon: SizedBox(
                          height: 15.h,
                          width: 15.h,
                          child: Image.asset("assets/icons/message-circle.png")),
                      activeIcon: SizedBox(
                          height: 15.h,
                          width: 15.h,
                          child: Image.asset(
                            "assets/icons/message-circle.png",
                            color: AppColors.primaryElement,
                          ))),
                  BottomNavigationBarItem(
                      label: "profile",
                      tooltip: "profile",
                      icon: SizedBox(
                          height: 15.h,
                          width: 15.h,
                          child: Image.asset("assets/icons/person2.png")),
                      activeIcon: SizedBox(
                          height: 15.h,
                          width: 15.h,
                          child: Image.asset(
                            "assets/icons/person2.png",
                            color: AppColors.primaryElement,
                          ))),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
