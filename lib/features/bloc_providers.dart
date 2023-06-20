import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/features/app/app_cubit/app_cubit.dart';
import 'package:learning_app/features/app/bloc/app_bloc.dart';
import 'package:learning_app/features/login/bloc/login_bloc.dart';
import 'package:learning_app/features/register/bloc/register_bloc.dart';
import 'package:learning_app/features/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(create: (context) => WelcomeBloc(),),
    BlocProvider(create: (context) => LoginBloc()),
    BlocProvider(create: (context) => RegisterBloc()),
    BlocProvider(create: (context) => AppCubit()),
    BlocProvider(create: (context) => AppBloc()),

  ];
}
