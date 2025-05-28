import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamrosampada/view/screens/dashboard/place_general_information.dart';

import 'package:url_launcher/url_launcher.dart';

class PlaceDetailScreen extends StatefulWidget {
  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> with SingleTickerProviderStateMixin {
  final FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;
  late TabController _tabController;
  String selectedLanguage = 'English';
  Map<String, String> aboutTexts = {
    'English': "Lying in the converging point of the Rudramati and Bagmati rivers in Jwagal lies the Dha Tala Mandir. It is one of the sacred Nadhi Ghat Devsthal and is revered as one of the eight Asthamatrika. This shrine, established during the Shah dynasty, may be relatively new, but it carries an ancient spirit. The original statue of the shrine was stolen, and it was re-constructed.",
    'Nepali': "ज्वागलमा रुद्रमती र बागमती नदीहरूको संगमस्थलमा अवस्थित धा ताल मन्दिर। यो पवित्र नदी घाट देवस्थल मध्ये एक हो र आठ अस्थामातृकामध्ये एकको रूपमा पूजित छ। यो मन्दिर शाह वंशको समयमा स्थापित भएको हो, यो अपेक्षाकृत नयाँ हुन सक्छ, तर यसले प्राचीन आत्मालाई बोकेको छ। मन्दिरको मूल मूर्ति चोरी भएको थियो, र यसलाई पुनर्निर्माण गरिएको थियो।",
    'Hindi': "ज्वागल में रुद्रमती और बागमती नदियों के संगम स्थल पर स्थित धा ताल मंदिर। यह पवित्र नदी घाट देवस्थलों में से एक है और आठ अष्टमातृकाओं में से एक के रूप में पूजनीय है। यह मंदिर शाह वंश के दौरान स्थापित किया गया था, यह अपेक्षाकृत नया हो सकता है, लेकिन यह एक प्राचीन आत्मा को ले जाता है। मंदिर की मूल मूर्ति चोरी हो गई थी, और इसे पुनर्निर्मित किया गया था।",
    "Chinese":"位于朱瓦加尔（Jwagal），鲁德拉玛蒂河（Rudramati）与巴格玛蒂河（Bagmati）交汇处的是 Dha Tala Mandir。它是神圣的 Nadhi Ghat Devsthal 之一，并被尊为八大神母（Asthamatrika）之一。这座神殿建立于 沙阿王朝（Shah dynasty） 期间，虽相对较新，却承载着古老的精神。原始的神像曾被盗，后又重建。"
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> toggleSpeech() async {
    if (isPlaying) {
      await flutterTts.stop();
    } else {
      await flutterTts.setLanguage(selectedLanguage == 'English' ? 'en-US' : selectedLanguage == 'Nepali' ? 'ne-NP' : selectedLanguage == 'Hindi' ? 'hi-IN' : 'zh-CN');
      await flutterTts.speak(aboutTexts[selectedLanguage]!);
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  Future<void> _launchPhone(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not dial $phoneNumber';
    }
  }

  Future<void> _launchMessage(String phoneNumber) async {
    final Uri url = Uri(scheme: 'sms', path: phoneNumber);
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not send message to $phoneNumber';
    }
  }

  Widget buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black54),
        SizedBox(width: 10),
        Text(
          "$label: $value",
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dha Tala Mandir", style: GoogleFonts.poppins(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        )),
        backgroundColor: Colors.orange[700],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "About"),
            Tab(text: "General"),
            Tab(text: "Assets"),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/t1.jpeg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Language Selection Dropdown
                  DropdownButton<String>(
                    value: selectedLanguage,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue!;
                      });
                    },
                    items: <String>['English', 'Nepali', 'Hindi', 'Chinese']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: Colors.orange[700],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Dha Tala Mandir",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(Icons.info, color: Colors.white),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.phone, color: Colors.white),
                              onPressed: () {
                                _launchPhone('1234567890'); // Example phone number
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.message, color: Colors.white),
                              onPressed: () {
                                _launchMessage('1234567890'); // Example phone number
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star, color: Colors.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // TabBarView
                  Container(
                    height: MediaQuery.of(context).size.height - 200, // Added height constraint for Column
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // About Tab content
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "General Information",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  aboutTexts[selectedLanguage]!,
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                SizedBox(height: 16.h),
                                ElevatedButton.icon(
                                  onPressed: toggleSpeech,
                                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                                  label: Text(isPlaying ? "Pause" : "Play"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Other Tab content...
                        GeneralScreen(),

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
