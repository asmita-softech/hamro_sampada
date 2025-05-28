import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hamrosampada/view/screens/dashboard/filter_screen.dart';
import 'package:hamrosampada/view/screens/dashboard/nearby_details_screen.dart';
import 'package:hamrosampada/view/screens/dashboard/qr_scan_screen.dart';
import '../../../utils/dt_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String currentAddress = "Fetching current location...";
  String selectedCategory = "All"; // Track the selected category

  Future<void> _getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          currentAddress = "Location services are disabled.";
        });
        return;
      }

      // Check and request location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            currentAddress = "Location permissions are denied.";
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          currentAddress =
              "Location permissions are permanently denied, we cannot request permissions.";
        });
        return;
      }

      // Get the user's current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get the address from the coordinates
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          currentAddress =
              "${place.subLocality}, ${place.locality}, ${place.administrativeArea}";
        });
      } else {
        setState(() {
          currentAddress = "Could not fetch location.";
        });
      }
    } catch (e) {
      print("Error fetching location: $e");
      setState(() {
        currentAddress = "Could not fetch location.";
      });
    }
  }

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.all_inclusive, 'text': 'All'},
    {'icon': Icons.temple_buddhist, 'text': 'Temple'},
    {'icon': Icons.park, 'text': 'Park'},
    {'icon': Icons.school, 'text': 'School'},
    {'icon': Icons.local_hospital, 'text': 'Hospital'},
    {'icon': Icons.restaurant, 'text': 'Restaurant'},
  ];

  final Map<String, List<Map<String, dynamic>>> items = {
    'All': [
      {'image': 'assets/t1.jpeg', 'name': 'Central Park', 'tag': '@CENTRAL', 'type': 'Park', 'location': 'New York, USA', 'phone': '1234567890'},
      {'image': 'assets/changu.jpeg', 'name': 'Changunarayan', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/boudhha.jpeg', 'name': 'Boudhha', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/t1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/pq.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/r1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
    ],
    'Temple': [
      {'image': 'assets/t1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/t1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/t1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/t1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
    ],
    'Park': [
      {'image': 'assets/pq.jpeg', 'name': 'Hyde Park', 'tag': '@HYDEPARK', 'type': 'Park', 'location': 'London, UK', 'phone': '555123456'},
      {'image': 'assets/pq.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/pq.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
    ],
    'School': [
      {'image': 'assets/s1.png', 'name': 'Springfield High', 'tag': '@SPRINGFIELD', 'type': 'School', 'location': 'Chicago, USA', 'phone': '4567891230'},
      {'image': 'assets/s1.png', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/s1.png', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/s1.png', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
    ],
    'Hospital': [
      {'image': 'assets/h1.jpeg', 'name': 'General Hospital', 'tag': '@GENHOSP', 'type': 'Hospital', 'location': 'Boston, USA', 'phone': '3214567890'},
      {'image': 'assets/h1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/h1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
    ],
    'Restaurant': [
      {'image': 'assets/r1.jpeg', 'name': 'Mama’s Kitchen', 'tag': '@MAMAKITCHEN', 'type': 'Restaurant', 'location': 'New York, USA', 'phone': '7891234560'},
      {'image': 'assets/r1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/r1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
      {'image': 'assets/r1.jpeg', 'name': 'Pashupatinath', 'tag': '@PASHUPATI', 'type': 'Temple', 'location': 'Kathmandu, Nepal', 'phone': '9876543210'},
    ],
  };

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QRScanScreen()));
              },
              child: Icon(
                Icons.qr_code_scanner,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              'Explore',
              style: GoogleFonts.aclonica(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor),
            ),
            Icon(
              Icons.search,
              color: AppColors.primaryColor,
            ),
            Icon(
              Icons.notifications,
              color: AppColors.primaryColor,
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FilterDialogScreen()));
              },
              child: Icon(
                Icons.filter_alt_rounded,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 8.w),
                  Text(
                    currentAddress,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 19.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 140.h,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index]['text'];
                        });
                      },
                      child: Column(
                        children: [
                          Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 10.h),
                              child: Icon(
                                categories[index]['icon'], // Dynamic icon
                                size: 40,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            categories[index]['text'],// Dynamic text
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Featured Ads',
                style: GoogleFonts.aclonica(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMiyHY-NBxzQGI-jWq3B3ItoTzUmSaizWWyQ&s"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMiyHY-NBxzQGI-jWq3B3ItoTzUmSaizWWyQ&s"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 180.h,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                ),
              ),
              Text(
                'Listed Nearby',
                style: GoogleFonts.aclonica(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items[selectedCategory]?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = items[selectedCategory]![index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NearbyDetailScreen()));
                    },
                    child: Card(
                      elevation: 5,
                      child: SizedBox(
                        width: double.infinity,
                        height: 170,
                        child: Row(
                          children: [
                            Image.asset(
                              item['image']!,
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name']!,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        item['tag']!,
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Icon(Icons.copy),
                                    ],
                                  ),
                                  Text(
                                    item['type']!,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on),
                                      Text(
                                        item['location']!,
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.phone),
                                      Text(
                                        item['phone']!,
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Icon(Icons.share),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
