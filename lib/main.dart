import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/screen/auth_screens/forgot_password_screen.dart';
import 'package:mobile_app/screen/auth_screens/signin_screen.dart';
import 'package:mobile_app/screen/auth_screens/signup_screen.dart';
import 'package:mobile_app/screen/walkthrough/splash_screen.dart';

import 'data/cubits/auth/auth_cubits.dart';
import 'data/repositories/auth_repositories.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:  [
          BlocProvider<AuthCubit>(create: (context) => AuthCubit(AuthRepository())),
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Yawo Social App",
          home:  const YawoSplashScreen(), //YawoWalkThrough(),
          routes: {
            SignInScreen.routeName: (context) => const SignInScreen(),
            ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
          },
        )
    );
  }
}


