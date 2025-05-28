import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LiveLocationScreen extends StatefulWidget {
  @override
  _LiveLocationScreenState createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends State<LiveLocationScreen> {
  late GoogleMapController _mapController;
  LatLng _currentLocation = LatLng(27.700769, 85.300140);
  late Position _position;
  String _address = "Loading...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location services are disabled.');

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    _position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = LatLng(_position.latitude, _position.longitude);
    });

    _getAddressFromCoordinates(_position.latitude, _position.longitude);
  }

  Future<void> _getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        setState(() {
          _address = "${placemarks[0].subLocality},${placemarks[0].locality},${placemarks[0].country}";
        });
      }
    } catch (e) {
      setState(() {
        _address = "Address not available";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentLocation,
              zoom: 15,
            ),
            onMapCreated: (controller) => _mapController = controller,
            myLocationEnabled: true,
          ),
          Positioned(
            top: 40.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5.r)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Enter a location or @hamroSampada",
                      style: TextStyle(fontSize: 16.sp, color: Colors.black54),
                    ),
                  ),
                  Icon(Icons.shopping_cart, color: Colors.green),
                ],
              ),
            ),
          ),
          Positioned(
            top: 100.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryButton("Sampada"),
                _buildCategoryButton("Tourist Places"),
                _buildCategoryButton("Hospitality"),

              ],
            ),
          ),
          Positioned(
            bottom: 150,
            left: 20,
            right: 20,
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text(_address),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.save, color: Colors.blue),
                    SizedBox(width: 10),
                    Icon(Icons.send, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80.h,
            right: 20.r,
            child: FloatingActionButton(
              onPressed: () {
                _mapController.animateCamera(CameraUpdate.newLatLng(_currentLocation));
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.my_location, color: Colors.white),
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildCategoryButton(String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shadowColor: Colors.grey),
      onPressed: () {},
      child: Text(label, style: TextStyle(color: Colors.black,fontSize: 14.sp)),
    );
  }
}

