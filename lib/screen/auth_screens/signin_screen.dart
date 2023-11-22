import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app/screen/auth_screens/signup_screen.dart';

import '../../util/constants/colors.dart';
import '../../util/constants/images_path.dart';
import 'forgot_password_screen.dart';


class SignInScreen extends StatefulWidget {
  static const routeName = '/signin';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

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

  InputDecoration getInputDecoration(String hintext, IconData iconData) {
    return InputDecoration(
      enabledBorder: kDefaultInputBorder,
      focusedBorder: kDefaultFocusInputBorder,
      focusedErrorBorder: kDefaultFocusErrorBorder,
      errorBorder: kDefaultFocusErrorBorder,
      filled: true,
      hintStyle: const TextStyle(color: kFormInputColor),
      hintText: hintext,
      fillColor: Colors.white70,
      prefixIcon: Icon(
        iconData,
        color: kFormInputColor,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
    );
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
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Image(image: AssetImage(yawo_logo), width: 70, height: 70,),
                    ),
                  ],
                ),
                  const SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text("Hi There !", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),

                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text("Please sign in with your details to access\nyour account.", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54),),

                    ]
                  ),
                  const SizedBox(height: 10,),
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
                                      'Email',
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
                                const SizedBox(height: 10),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0.0, bottom: 5.0),
                                    child: Text(
                                      'Password',
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
                                        Icons.lock_outlined,
                                        color: kFormInputColor,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            hidePassword = !hidePassword;
                                          });
                                        },
                                        color: Colors.black54,
                                        icon: Icon(hidePassword
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined),
                                      ),
                                    ),
                                    // InputDecoration(
                                    //   enabledBorder: const OutlineInputBorder(
                                    //     borderRadius:
                                    //     BorderRadius.all(Radius.circular(12.0)),
                                    //     borderSide:
                                    //     BorderSide(color: Colors.white, width: 2),
                                    //   ),
                                    //   focusedBorder: const OutlineInputBorder(
                                    //     borderRadius:
                                    //     BorderRadius.all(Radius.circular(12.0)),
                                    //     borderSide:
                                    //     BorderSide(color: Colors.white, width: 2),
                                    //   ),
                                    //   border: const OutlineInputBorder(
                                    //     borderSide: BorderSide(color: Colors.white),
                                    //     borderRadius: BorderRadius.all(
                                    //       Radius.circular(12.0),
                                    //     ),
                                    //   ),
                                    //   filled: true,
                                    //   hintStyle: const TextStyle(
                                    //       color: Colors.black54, fontSize: 14),
                                    //   hintText: "",
                                    //   fillColor: Colors.white,
                                    //   contentPadding: const EdgeInsets.symmetric(
                                    //       vertical: 18, horizontal: 15),
                                    //   prefixIcon: const Icon(
                                    //     Icons.lock_outlined,
                                    //     color: Colors.black54,
                                    //   ),

                                    // ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 0.0, bottom: 0.0),
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: rememberMe,
                                              checkColor: mainColor,
                                              activeColor: Colors.white,
                                              onChanged: (value) {
                                                setState(() {
                                                  rememberMe = value!;
                                                });
                                              },
                                            ),
                                            Text('Remember Me', style: TextStyle(color: Colors.black54,),),
                                          ],
                                        ),

                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(ForgotPasswordScreen.routeName);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 10),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(color: mainColor, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),


                                SizedBox(height: 20,),
                                SizedBox(
                                  width: double.infinity,
                                  child: MaterialButton(
                                    elevation: 0,
                                    onPressed: () {

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
                                      'Sign In',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Text('or Sign In with', style: TextStyle(color: Colors.black54),),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 35,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent, // Facebook color
                                        borderRadius: BorderRadius.circular(7.0),
                                        border: Border.all(
                                          color: Colors.black54, // Border color
                                          width: 1.0, // Border width
                                        ),// Adjust the radius as needed
                                      ),
                                      width: 140,
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            FontAwesomeIcons.facebook,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(width: 8.0,),
                                          Text(
                                            "Facebook",
                                            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 16.0,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent, // Facebook color
                                        borderRadius: BorderRadius.circular(7.0),
                                        border: Border.all(
                                          color: Colors.black54, // Border color
                                          width: 1.0, // Border width
                                        ),// Adjust the radius as needed
                                      ),
                                      width: 140,
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.google,
                                            color: Color(0xFF8C0303),
                                          ),
                                          SizedBox(width: 8.0,),
                                          Text(
                                            "Google",
                                            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),

                        ),
                      ),
                      SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ?", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),),
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
        ),
      )
    );
  }
}


const kDefaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Colors.white, width: 2),
);

const kDefaultFocusInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Colors.black54, width: 2),
);
const kDefaultFocusErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.red),
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
);
