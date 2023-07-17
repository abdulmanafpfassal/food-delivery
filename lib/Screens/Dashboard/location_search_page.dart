import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/Helper/utils.dart';
import 'package:fooddelivery/Screens/Dashboard/home_page.dart';
import 'package:fooddelivery/Service/Provider/location_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class LocationSearch extends StatefulWidget {
  const LocationSearch({super.key});

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Enter your area or apartment name", style: GoogleFonts.poppins(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black
        ),),
        elevation: 0,
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Center(
                child: Text("Skip", style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
                ),),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 10.h,),
            Consumer<LocationProvider>(
              builder: (context, location, _) {

                return Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  width: getWidth(context),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: location.selectedLocation,
                      prefixIcon: Icon(IconlyLight.search),
                    ),
                  ),
                );
              }
            ),
            SizedBox(height: 10.h,),
            InkWell(
              onTap: (){
                context.read<LocationProvider>().setLocationData();
              },
              child: Row(
                children: [
                  Transform.rotate(
                      angle: 180 * math.pi / 800,
                      child: Icon(Icons.navigation, color: Colors.deepOrange,)),
                  SizedBox(width: 10.w,),
                  Text("Use my Current Location", style: GoogleFonts.poppins(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Divider(),
            Text("SAVED ADDRESS", style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 10.sp
            ),)
          ],
        ),
      ),
    );
  }
}
