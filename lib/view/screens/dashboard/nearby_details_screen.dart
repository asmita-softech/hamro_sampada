import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hamrosampada/view/screens/dashboard/place_detail_screen.dart';

class NearbyDetailScreen extends StatefulWidget {
  @override
  State<NearbyDetailScreen> createState() => _NearbyDetailScreenState();
}

class _NearbyDetailScreenState extends State<NearbyDetailScreen> {
  late GoogleMapController _mapController;

  final LatLng _hostelLocation = LatLng(27.6517, 85.3240); // Replace with actual coordinates
  final LatLng _userLocation = LatLng(27.6675, 85.3206); // Example: User's location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Map Section
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _hostelLocation,
                    zoom: 15.0,
                  ),
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId('hostel'),
                      position: _hostelLocation,
                      infoWindow: InfoWindow(
                        title: 'GPA Girls Hostel',
                        snippet: 'Hattiban Marg, Dhapakhel',
                      ),
                    ),
                    Marker(
                      markerId: MarkerId('user'),
                      position: _userLocation,
                      infoWindow: InfoWindow(
                        title: 'Your Location',
                      ),
                    ),
                  },
                  polylines: {
                    Polyline(
                      polylineId: PolylineId('route'),
                      points: [_userLocation, _hostelLocation],
                      color: Colors.blue,
                      width: 5,
                    ),
                  },
                ),
                Positioned(
                  top: 16.h,
                  left: 16.w,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 16.h,
                  right: 16.w,
                  child: Icon(Icons.my_location, color: Colors.blue),
                ),
              ],
            ),
          ),

          // Details Section
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlaceDetailScreen()));
              },
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          'assets/image1.jpeg',
                          width:200.w,
                          height: 120.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'GPA Girls Hostel',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '@GPAGIRLS',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Girls Hostel',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                             mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on, size: 16.sp),
                              SizedBox(width: 4.w),
                              Text(
                                'Kharibot, Lalitpur, Nepal',
                                style: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.phone, size: 16.sp),
                              SizedBox(width: 4.w),
                              Text(
                                '9800606060',
                                style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                ),
                              ),


                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Good food, Laundry facility, 24 hrs water & free wifi, and many more.",
                      style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),
                    ),
                  ),
                  Spacer(),
                  // Bottom Action Buttons
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.navigation, color: Colors.white),
                          label: Text("Go"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.message, color: Colors.white),
                          label: Text("Message"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.call, color: Colors.white),
                          label: Text("Call"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
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

