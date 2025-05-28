import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../components/dt_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';


class InitialOnboardingScreen extends StatefulWidget {
  const InitialOnboardingScreen({super.key});

  @override
  State<InitialOnboardingScreen> createState() => _InitialOnboardingScreenState();
}

class _InitialOnboardingScreenState extends State<InitialOnboardingScreen> {
  final PageController controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content with PageView
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() => isLastPage = index == 2); // Assuming 3 pages (index 0, 1, 2)
              },
              children: [
                // Page 1
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Instantly Share Location',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,

                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Share your location with your desired contact and communicate in real time.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,

                      ),
                    ),
                  ],
                ),
                // Page 2
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Stay Connected',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,

                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Track the real-time location of your friends and family effortlessly.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,

                      ),
                    ),
                  ],
                ),
                // Page 3
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Secure and Reliable',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,

                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Your data is safe with us. Enjoy a secure and hassle-free experience.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom Sheet
      bottomSheet: isLastPage
          ? Padding(
        padding: EdgeInsets.all(12.w),
        child: DtButton(

          backgroundColor: Colors.green,
          label: 'Get Started',
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('showHome', true);
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));// Navigate to home
          },
        ),
      )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () => controller.jumpToPage, child: Text('SKIP')),
            Center(
              child: SmoothPageIndicator(controller: controller, count: 3),
            ),
            TextButton(onPressed: () => controller.page, child: Text('NEXT')),
          ]
        ),
      ),
    );
  }
}

