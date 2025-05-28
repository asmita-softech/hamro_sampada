import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/dt_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Notifications",style: GoogleFonts.poppins(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(12.r),
             ),
              width: double.infinity,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 18.w,vertical: 22.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to HamroSampadaApp!',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      'Your adventure starts here!',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      'Jan 16,2025 07:49 PM',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
