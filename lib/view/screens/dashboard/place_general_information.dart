import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GeneralScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Stack(
              children: [
                Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/t1.jpeg'), //
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],
            ),



            // Information Card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                  child: Column(
                    children: [
                      buildInfoRow(Icons.email, "Email", "info@lmc.gov.np"),
                      buildInfoRow(Icons.phone, "Contact", "9803862736"),
                      buildInfoRow(Icons.alternate_email, "KahaTAG", "DHATALAMANDIR"),
                      buildInfoRow(Icons.language, "Website", "sampada.kaha.com.np"),
                    ],
                  ),
                ),
              ),
            ),

            // Open Hours (Placeholder)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ExpansionTile(
                title: Text("Open Hours", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                children: [
                  ListTile(title: Text("Monday - Friday: 9 AM - 5 PM")),
                  ListTile(title: Text("Saturday - Sunday: 10 AM - 4 PM")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(icon, size: 24.h, color: Colors.black54),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 14.sp, color: Colors.black54)),
                Text(value, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
