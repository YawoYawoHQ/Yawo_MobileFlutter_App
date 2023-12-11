import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/screen/auth_screens/change_password_screen.dart';
import 'package:mobile_app/screen/auth_screens/change_password_success_screen.dart';
import 'package:mobile_app/screen/auth_screens/change_username_signup_screen.dart';
import 'package:mobile_app/screen/auth_screens/forgot_password_screen.dart';
import 'package:mobile_app/screen/auth_screens/otp_forgot_password_screen.dart';
import 'package:mobile_app/screen/auth_screens/otp_signup_screen.dart';
import 'package:mobile_app/screen/auth_screens/otp_success_screen.dart';
import 'package:mobile_app/screen/auth_screens/signin_screen.dart';
import 'package:mobile_app/screen/auth_screens/signup_screen.dart';
import 'package:mobile_app/screen/auth_screens/verify_email_signup_screen.dart';
import 'package:mobile_app/screen/dashboard_screens/improve_feed_screen.dart';
import 'package:mobile_app/screen/dashboard_screens/tab_screen.dart';
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
            SignUpScreen.routeName: (context) => SignUpScreen(),
            VerifyEmailSignUpScreen.routeName: (context) => const VerifyEmailSignUpScreen(),
            OtpSignUpScreen.routeName: (context) => const OtpSignUpScreen(),
            OtpSuccessScreen.routeName: (context) => const OtpSuccessScreen(),
            ChangeUsernameSignUpScreen.routeName: (context) => const ChangeUsernameSignUpScreen(),
            ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
            OtpForgotPasswordScreen.routeName: (context) => const OtpForgotPasswordScreen(),
            ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen(),
            ChangePasswordSuccessScreen.routeName: (context) => const ChangePasswordSuccessScreen(),
            ImproveFeedScreen.routeName: (context) => const ImproveFeedScreen(),
            TabScreen.routeName: (context) => const TabScreen(),
          },
        )
    );
  }
}


