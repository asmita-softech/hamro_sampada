import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamrosampada/view/screens/onboarding/signup_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../components/dt_button.dart';
import '../../../components/expanded_bottom_nav_bar.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: Image.asset('assets/bg.png', fit: BoxFit.cover)),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 32.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Icon(Icons.logo_dev),
                Spacer(),

                IntlPhoneField(
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),

                    ),
                  ),
                  initialCountryCode: 'NP',
                  languageCode: "en",
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(

                  decoration: InputDecoration(

                    labelText: 'Password',

                    border: OutlineInputBorder(

                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,

                ),
               SizedBox(height: 20.h,),
                Center(
                  child: DtButton(
                      backgroundColor: Colors.green,
                      label: 'Log In',
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ExpandedBottomNavBar()));
                      }),
                ),
                SizedBox(height: 10.h,),
                Center(
                  child: Wrap(
                    children: [
                      Text('Don\'t have an account yet?',style: TextStyle(
                    fontSize: 16.sp,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,

                  )),
                      InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                        },
                        child: Text('Create new',style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500,

                        )),
                      ),
                    ],
                  ),

                ),
                Spacer(),
                Center(
                  child: Text('Proceed without Login',style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,

                  )),
                ),
                Spacer(),
                Icon(Icons.logo_dev),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
