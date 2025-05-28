import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamrosampada/view/screens/profile_detail_screens/about_screen.dart';
import 'package:hamrosampada/view/screens/profile_detail_screens/data_deletion_screen.dart';
import 'package:hamrosampada/view/screens/profile_detail_screens/my_business_screen.dart';
import 'package:hamrosampada/view/screens/profile_detail_screens/privacy_policy_screen.dart';
import 'package:hamrosampada/view/screens/profile_detail_screens/support_screen.dart';
import 'package:hamrosampada/view/screens/profile_detail_screens/terms_and_conditions_screen.dart';

import '../../../utils/dt_colors.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile",style: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),),
            Icon(Icons.qr_code_scanner,color: AppColors.primaryColor,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
        
          children: [
               CircleAvatar(
                 radius: 30.r,
               ),
            Text("Name",style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
        
            ),),
            Text("9700000012",style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
        
            ),),
            SizedBox(height: 30.h,),
            Divider(),
            profileOptions(Icons.heart_broken, 'Favourites',(){}),
            profileOptions(Icons.business, 'My Businesses',(){
              Navigator.push(context, MaterialPageRoute(builder: (_) => MyBusinessScreen()));
            }),
            profileOptions(Icons.support, 'Support',(){
              Navigator.push(context, MaterialPageRoute(builder: (_) => SupportScreen()));
            }),
            profileOptions(Icons.note, 'Terms and Conditions',(){
              Navigator.push(context, MaterialPageRoute(builder: (_) => TermsAndConditionsScreen()));
            }),
            profileOptions(Icons.privacy_tip, 'Privacy Policy',(){
              Navigator.push(context, MaterialPageRoute(builder: (_) => PrivacyPolicyScreen()));
            }),
            profileOptions(Icons.details, 'About',(){
              Navigator.push(context, MaterialPageRoute(builder: (_) => AboutScreen()));
            }),
            profileOptions(Icons.delete, 'Data Deletion',(){
              Navigator.push(context, MaterialPageRoute(builder: (_) => UserDataDeletionScreen()));
            }),
            profileOptions(Icons.logout, 'Sign Out',(){}),
          ],
        ),
      ),

    );
  }

  Widget profileOptions(IconData icons,String option,VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icons),
          title: Text(option,style: GoogleFonts.roboto(
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),),
          trailing:  Icon(Icons.arrow_forward_ios_rounded,),
          onTap: onTap,
        ),
        Divider(),
      ],
    );
  }
}
