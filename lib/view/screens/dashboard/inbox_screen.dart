import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamrosampada/view/screens/dashboard/chat_screen.dart';
import '../../../../utils/dt_colors.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                "Chat",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Icon(Icons.search, color: AppColors.primaryColor),
            SizedBox(width: 16),
            CircleAvatar(),
          ],
        ),
      ),
      body: Column(
        children: [
          // TabBar Widget
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 8.h,
                ),
                leading: const CircleAvatar(),
                title: Text(
                  'Name',
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: tabController,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              indicatorColor: AppColors.primaryColor,
              tabs: const [
                Tab(text: 'Message'),
                Tab(text: 'Shared'),
              ],
            ),
          ),
          // TabBarView
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                // Tab 1 Content
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                  child: Container(
                    // color: Colors.orange,
                    child: Column(
                      children: [
                        Image.asset('assets/chat.png',height: 350.h,),
                        Text('There is no any messages',style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),),
                        SizedBox(height: 20.h,),
                        Align(
                          alignment: Alignment.bottomRight,
                            child: CircleAvatar(child: IconButton(
                              icon: Icon(Icons.person_add,size: 32.h,),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatScreen()));
                              },
                            ),)),
                      ],
                    ),
                  ),
                ),
                // Tab 2 Content
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                  child: Container(
                    // color: Colors.orange,
                    child: Column(
                      children: [
                        Image.asset('assets/chat.png',height: 400.h,),
                        Text('You have no shared addresses',style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
