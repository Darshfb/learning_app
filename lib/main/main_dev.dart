import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/routes/routes.dart';
import 'package:learning_app/common/values/constants.dart';
import 'package:learning_app/features/bloc_providers.dart';
import 'package:learning_app/features/welcome/welcome.dart';
import 'package:learning_app/global.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

late String firstRoute;
void main() async{
  await Global.init();

  FirebaseAuth.instance.authStateChanges().listen((user) {
    if(user == null){
      firstRoute = AppRoutes.loginRoute;
    }else{
      firstRoute = AppRoutes.app;
    }
  });
  /// id => 93b3269a-4573-4059-9708-b6afc2222bd7
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("93b3269a-4573-4059-9708-b6afc2222bd7");
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    debugPrint("Accepted permission: $accepted");
  });
  var status = await OneSignal.shared.getDeviceState();

  var playerId = status?.userId;
  debugPrint("USERID is $playerId");
  await OneSignal.shared.postNotification(
      OSCreateNotification(
          playerIds: [playerId!],
          content: "this is a test from OneSignal's Flutter SDK",
          heading: "Test Notification",
          url: "www.google.com",
          subtitle: "subtitle",
          buttons: [
            OSActionButton(text: "test1", id: "www.google.com", icon: "www.google.com"),
            OSActionButton(text: "test2", id: "id2")
          ]
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static bool deviceFirstOpen = Global.storageService.getBool(key: AppConstants.deviceFirstOpen) ?? false;
  @override
  Widget build(BuildContext context) {
    debugPrint(deviceFirstOpen.toString());
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: AppBlocProviders.allBlocProviders,
          child: MaterialApp(
            builder: FToastBuilder(),
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              useMaterial3: true,
            ),
            home: const WelcomeScreen(),
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: deviceFirstOpen ? firstRoute :AppRoutes.initial,
          ),
        );
      },
    );
  }
}
