import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../utils/dt_colors.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import '../../../utils/dt_colors.dart';

class QRScanScreen extends StatelessWidget {
  const QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_rounded),
            ),
            SizedBox(width: 30.w),
            Text(
              "QR Scan",
              style: GoogleFonts.poppins(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: QRCodeDartScanView(

        scanInvertedQRCode: true,
        typeScan: TypeScan.live,
        onCapture: (Result result) {
          if (result.text != null) {
            Get.snackbar("QR Code Captured", result.text);
          } else {
            Get.snackbar("Error", "Unable to read QR code.");
          }
        },
      ),
    );
  }
}
