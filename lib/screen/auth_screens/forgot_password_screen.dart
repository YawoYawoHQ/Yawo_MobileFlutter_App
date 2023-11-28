import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app/screen/auth_screens/signup_screen.dart';

import '../../common/widgets/auth_widget.dart';
import '../../util/constants/colors.dart';
import '../../util/constants/images_path.dart';
import '../dashboard_screens/tab_screen.dart';
import 'otp_forgot_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot-password';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  bool hidePassword = true;
  // bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: bgNeutralColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: bgNeutralColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: IconButton(onPressed: () {
                        Navigator.pop(context);
                      },
                          icon: Icon(Icons.arrow_back)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Image(image: AssetImage(lock_icon), width: 70, height: 70,),
                    )
                  ],
                ),

                const SizedBox(height: 20,),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Text("Forgot Password", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                  ],
                ),
                const SizedBox(height: 15,),
                const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text("Please select contact details to receive a\nrecovery code", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54),),

                    ]
                ),
                const SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0.0, bottom: 5.0),
                                  child: Text(
                                    'Via Email Address',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 1.0, top: 0.0, right: 0.0, bottom: 8.0),
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 14),
                                  decoration: getInputDecoration(
                                    '',
                                    Icons.email_outlined,
                                  ),
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (input) =>
                                  !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                      .hasMatch(input!)
                                      ? "Email Id should be valid"
                                      : null,
                                  onSaved: (value) {
                                    // _authData['email'] = value.toString();
                                    _emailController.text = value as String;
                                  },
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0.0, bottom: 5.0),
                                  child: Text(
                                    'Via SMS',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, top: 0.0, right: 0.0, bottom: 4.0),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  controller: _passwordController,
                                  onSaved: (input) {
                                    _passwordController.text = input as String;
                                  },
                                  validator: (input) => input!.length < 3
                                      ? "Password should be more than 3 characters"
                                      : null,
                                  obscureText: hidePassword,
                                  decoration: InputDecoration(
                                    enabledBorder: kDefaultInputBorder,
                                    focusedBorder: kDefaultFocusInputBorder,
                                    focusedErrorBorder: kDefaultFocusErrorBorder,
                                    errorBorder: kDefaultFocusErrorBorder,
                                    filled: true,
                                    hintStyle: const TextStyle(color: kFormInputColor),
                                    hintText: "",
                                    fillColor: Colors.white70,
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.message,
                                      color: kFormInputColor,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 5),

                                  ),

                                ),
                              ),



                              SizedBox(height: 20,),
                              SizedBox(
                                width: double.infinity,
                                child: MaterialButton(
                                  elevation: 0,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(OtpForgotPasswordScreen.routeName);
                                    // print(_userData['validity']);
                                  },
                                  color: mainColor,
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  splashColor: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(15.0),
                                    side: const BorderSide(
                                        color: mainColor),
                                  ),
                                  child: const Text(
                                    'Continue',

                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),




                              SizedBox(height: 0,),


                            ],
                          ),
                        ),

                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("I don't have an account ?", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context)
                                  .pushNamed(SignUpScreen.routeName);
                            },
                            child: Text("Sign Up", style: TextStyle(color: mainColor, fontWeight: FontWeight.w600),)
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
