import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/screen/auth_screens/signin_screen.dart';

import '../../common/widgets/auth_widget.dart';
import '../../util/constants/colors.dart';




class ChangeUsernameSignUpScreen extends StatefulWidget {
  static const routeName = '/change-username';
  const ChangeUsernameSignUpScreen({super.key});

  @override
  State<ChangeUsernameSignUpScreen> createState() => _ChangeUsernameSignUpScreenState();
}

class _ChangeUsernameSignUpScreenState extends State<ChangeUsernameSignUpScreen> {

  final _fullnameController = TextEditingController();

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


                const SizedBox(height: 60,),

                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Text("Change Username", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                  ],
                ),
                const SizedBox(height: 15,),
                const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text("Add a username you can change your\nusername anytime.", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54),),

                    ]
                ),
                const SizedBox(height: 50,),

                const Align(
                  alignment: Alignment.centerLeft,
                  child:
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 5.0),
                    child: Text(
                      'Username',
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
                      left: 30.0, top: 0.0, right: 30.0, bottom: 8.0),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration: getInputDecoration(
                      '',
                      Icons.person_2_outlined,
                    ),
                    controller: _fullnameController,
                    keyboardType: TextInputType.name,
                    validator: (input) =>
                    true
                        ? "Fullname Id should be valid"
                        : null,
                    onSaved: (value) {
                      // _authData['email'] = value.toString();
                      _fullnameController.text = value as String;
                    },
                  ),
                ),

                const SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(SignInScreen.routeName);
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
                        'Next',

                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),


              ],

            ),
          ),
        ),
      ),
    );
  }
}