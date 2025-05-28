import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamrosampada/view/screens/profile_detail_screens/profile_screen.dart';


import '../../../../utils/dt_colors.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Home",style: GoogleFonts.poppins(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 20.h),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                leading: CircleAvatar(),
                title:  Text(
                  'name',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                cardElement(
                  icon: Icons.person,
                  label: "Profile",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                  },
                ),
                cardElement(
                  icon: Icons.notifications,
                  label: "Notifications",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationsScreen()));
                  },
                ),

              ],
            ),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardElement(
                  icon: Icons.inbox,
                  label: "Inbox",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                  },
                ),
                cardElement(
                  icon: Icons.qr_code_scanner,
                  label: "My Qrs",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardElement({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6.r,
              spreadRadius: 2.r,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32.h, color: const Color(0xff15A196)),
            SizedBox(height: 10.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
