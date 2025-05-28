import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamrosampada/view/screens/onboarding/verification_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


import '../../../../components/dt_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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

                  SizedBox(height: 20.h,),
                  Center(
                    child: DtButton(
                        backgroundColor: Colors.grey,
                        label: 'Next',
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerificationScreen()));
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
