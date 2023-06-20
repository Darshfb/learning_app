// unify bloc Provider and routes and screens
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/features/login/bloc/login_bloc.dart';
import 'package:learning_app/features/login/login_screen.dart';
import 'package:learning_app/features/register/bloc/register_bloc.dart';
import 'package:learning_app/features/register/register_screen.dart';
import 'package:learning_app/features/welcome/bloc/welcome_bloc.dart';
import 'package:learning_app/features/welcome/welcome.dart';

class AppScreens {
  static List<ScreenEntity> routes(){
    return [
      ScreenEntity(
        route: AppRoutes.initial,
        screen: const WelcomeScreen(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      ScreenEntity(
        route: AppRoutes.loginRoute,
        screen: LoginScreen(),
        bloc: BlocProvider(create: (_) => LoginBloc()),
      ),
      ScreenEntity(
        route: AppRoutes.registerScreen,
        screen: RegisterScreen(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      ScreenEntity(
        route: AppRoutes.app,
        screen: const WelcomeScreen(),
        // bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
    ];
  }

  /// a model that covers entire screen as we click on navigator object
  // static MaterialPageRoute generateRouteSettings(RouteSettings settings){
  //   if(settings.name != null)
  //   {
  //     ///check for route name matching when navigator gets triggered.
  //     var result = routes().where((element) => element.route == settings.name);
  //     if(result.isNotEmpty){
  //       return MaterialPageRoute(builder: (_)=> result.first.screen, settings: settings);
  //     }
  //   }
  // }

  /// return all the bloc providers
  static List<dynamic> allProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic> [];
    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
}

class ScreenEntity {
  String route;
  Widget screen;
  dynamic bloc;

  ScreenEntity({
    required this.route,
    required this.screen,
    this.bloc,
  });
}
