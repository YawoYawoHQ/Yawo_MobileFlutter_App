import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/screen/auth_screens/signin_screen.dart';

import '../../util/constants/colors.dart';
import '../../util/constants/images_path.dart';
import 'change_username_signup_screen.dart';
import 'otp_signup_screen.dart';


class OtpSuccessScreen extends StatefulWidget {
  static const routeName = '/otp-success';
  const OtpSuccessScreen({super.key});

  @override
  State<OtpSuccessScreen> createState() => _OtpSuccessScreenState();
}

class _OtpSuccessScreenState extends State<OtpSuccessScreen> {


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
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Image(image: AssetImage(otp_success,), width: 250,),
                    )
                  ],
                ),

                const SizedBox(height: 20,),


                const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text("Your email address has successfully\nbeen verified!", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54),),

                    ]
                ),
                const SizedBox(height: 50,),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ChangeUsernameSignUpScreen.routeName);
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
                        'Continue to Sign Up',

                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

              ],

            ),
          ),
        ),
      ),
    );
  }
}