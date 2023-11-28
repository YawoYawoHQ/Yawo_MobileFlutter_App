import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/screen/auth_screens/signin_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../util/constants/colors.dart';
import '../../util/constants/images_path.dart';
import 'change_password_screen.dart';
import 'otp_success_screen.dart';


class OtpForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/otp-forgot-password';
  const OtpForgotPasswordScreen({super.key});

  @override
  State<OtpForgotPasswordScreen> createState() => _OtpForgotPasswordState();
}

class _OtpForgotPasswordState extends State<OtpForgotPasswordScreen> {


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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      child: Image(image: AssetImage(email_icon), width: 70, height: 70,),
                    )
                  ],
                ),

                const SizedBox(height: 20,),
                //
                // const Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //
                //   children: <Widget>[
                //     Text("Verify Your Email Address", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                //   ],
                // ),
                // const SizedBox(height: 15,),
                const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text("Please enter the 4 digits code sent to your\nyour email address", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54),),

                    ]
                ),
                const SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OTPTextField(
                        length: 4,
                        width: 250,
                        fieldWidth: 45,
                        style: const TextStyle(
                            fontSize: 14
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        fieldStyle: FieldStyle.box,
                        onChanged: (value){

                        },
                        onCompleted: (pin){
                          setState(() {

                          });
                          debugPrint("Completed: $pin");
                        }
                    ),
                  ],
                ),

                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                        onPressed: (){},
                        child: Text("Resend Code", style: TextStyle(color: mainColor, fontWeight: FontWeight.w500, fontSize: 16),))
                  ],
                ),

                const SizedBox(height: 40,),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ChangePasswordScreen.routeName);
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
                        'Verify',

                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I already have an account ?", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),),
                    TextButton(
                        onPressed: (){
                          Navigator.of(context)
                              .pushNamed(SignInScreen.routeName);
                        },
                        child: Text("Sign In", style: TextStyle(color: mainColor, fontWeight: FontWeight.w600),)
                    ),
                  ],
                )

              ],

            ),
          ),
        ),
      ),
    );
  }
}