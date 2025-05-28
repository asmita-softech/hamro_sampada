import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green[100],
                child: Text(
                  'AL',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alina Thapa',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '9802000000',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),

        ),
        body: Column(
          children: [
            Spacer(),
            Container(
              color: Colors.grey[200],
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'hello',
                          style: TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                        Text(
                          'Just now at 1:16 PM',
                          style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey)),
              ),
              child: Row(
                children: [
                  Icon(Icons.camera_alt, color: Colors.green),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Send Message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.location_on, color: Colors.green),
                  SizedBox(width: 10.w),
                  Icon(Icons.attachment, color: Colors.green),
                  SizedBox(width: 10.w),
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.send, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
