import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';

import '../../../../components/expanded_bottom_nav_bar.dart';
import '../../../components/dt_button.dart';

class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({super.key});

  @override
  State<RegistrationFormScreen> createState() => _RegistrationFormScreenState();
}

class _RegistrationFormScreenState extends State<RegistrationFormScreen> {
  bool? value = false;
  TextEditingController dateInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset('assets/bg.png', fit: BoxFit.cover)),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios_rounded),
                Text('Skip',style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 22.sp,
                  color: Colors.blue,
                ),),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(height: 80.h),
                Text('Gender',style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 22.sp,
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DtButton(
                      width: 120.w,
                      label: 'Male',
                      onPressed: () {},
                      backgroundColor: Colors.grey,
                    ),
                    DtButton(
                      width: 120.w,
                      label: 'Female',
                      onPressed: () {},
                      backgroundColor: Colors.grey,
                    ),
                    DtButton(
                      width: 100.w,
                      label: 'Other',
                      onPressed: () {},
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name (Required*)',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,

                ),
                SizedBox(height: 20.h,),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Last Name (Required*)',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,

                ),
                SizedBox(height: 20.h,),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,

                ),
                SizedBox(height: 20.h,),
              TextField(
                controller: dateInput,
                //editing controller of this TextField
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                    ),
                    //icon of text field
                    labelText: "Date of Birth" //label text of field
                ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    Checkbox(
                      tristate: true,
                        value: value, onChanged: (bool? newValue){
                        setState(() {
                          value = newValue;
                        });
                    }),
                    Text('I agree to Terms and Conditions and\n Privacy Policy',

                      style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Colors.grey.shade700,
                    ),),
                  ],
                ),
                DtButton(
                  width: double.infinity,
                  padding: 38.w,
                    label: 'Submit',
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ExpandedBottomNavBar()));
                    },
                  backgroundColor: Colors.green,
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}
