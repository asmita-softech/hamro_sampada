import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamrosampada/view/screens/onboarding/registration_form_screen.dart';

import 'package:otp_pin_field/otp_pin_field.dart';

import '../../../../components/dt_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

void _hideKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

class _VerificationScreenState extends State<VerificationScreen> {
  ///  Otp pin Controller
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
      Positioned.fill(child: Image.asset('assets/bg.png', fit: BoxFit.cover)),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Enter verification code',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            OtpPinField(
              key: _otpPinFieldController,

              ///in case you want to enable autoFill
              autoFillEnable: true,

              ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
              textInputAction: TextInputAction.done,

              ///in case you want to change the action of keyboard
              /// to clear the Otp pin Controller
              onSubmit: (text) {
                debugPrint('Entered pin is $text');

                /// return the entered pin
              },
              onChange: (text) {
                debugPrint('Enter on change pin is $text');

                /// return the entered pin
              },
              onCodeChanged: (code) {
                debugPrint('onCodeChanged  is $code');
              },

              /// to decorate your Otp_Pin_Field
              otpPinFieldStyle: const OtpPinFieldStyle(
                /// bool to show hints in pin field or not
                showHintText: false,



                fieldBorderWidth: 3,

              ),
              maxLength: 4,

              /// no of pin field
              showCursor: true,

              /// bool to show cursor in pin field or not
              cursorColor: Colors.indigo,

              /// to choose cursor color
              upperChild:  Column(
                children: [
                  SizedBox(width: 50.h),
                  Icon(Icons.flutter_dash_outlined, size: 150.h),
                  SizedBox(height: 20.h),
                ],
              ),
              // 123456
              middleChild: Column(
                children: [
                   SizedBox(height: 30.h),
                  ElevatedButton(
                      onPressed: () {
                        _otpPinFieldController.currentState
                            ?.clearOtp(); // clear controller
                      },
                      child: const Text('clear OTP')),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Next Class')),
                  const SizedBox(height: 30),
                ],
              ),

              cursorWidth: 3,
              /// place otp pin field according to yourself
              mainAxisAlignment: MainAxisAlignment.center,


              otpPinFieldDecoration:
                  OtpPinFieldDecoration.defaultPinBoxDecoration,
            ),
            SizedBox(height: 20.h,),
            Center(
              child: Text(
                  'A code has been sent to\n +977-977-777-7777 via SMS',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Center(
              child: Text(
                'Resend Otp',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 40.h,),
            Center(
              child: DtButton(



                  backgroundColor: Colors.grey.shade600,
                  label: 'Verify',
                  onPressed: (){

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegistrationFormScreen()));

                  }),
            ),
          ],
        ),
      ),
    ],
        ));
  }
}
