import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/Service/Provider/location_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../Helper/images.dart';
import '../../Helper/utils.dart';
import '../../Service/Provider/resturant_list_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      context.read<RestaurantListProvider>().setRestaurantList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          context.read<LocationProvider>().selectedLocation.toString(),
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 12.sp),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrow_left,
            color: Colors.black,
            size: 15.sp,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 30.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r)),
              width: getWidth(context),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search for dishes, restaurants, and groceries",
                  hintStyle:
                      GoogleFonts.poppins(color: Colors.grey, fontSize: 12.sp),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(IconlyLight.search),
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(
                        IconlyLight.voice,
                        color: Colors.deepOrange,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Expanded(
              child: Consumer<RestaurantListProvider>(
                builder: (context, restaurant, _) {
                  return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, ind) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                    itemCount: restaurant.restaurant.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.asset(restaurant.restaurant[index]["image"], height: 100.h,width: 130.w,fit: BoxFit.cover,),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            SizedBox(width: 10.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(restaurant.restaurant[index]["restaurant_name"], style: GoogleFonts.poppins(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600
                                    ),),
                                    SizedBox(width: 10.w,),
                                    Icon(Icons.circle, size: 6.sp,),
                                    SizedBox(width: 10.w,),
                                    Text(restaurant.restaurant[index]["delivery_time"], style: GoogleFonts.poppins(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ],
                                ),
                                Text(restaurant.restaurant[index]["address"], style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  color: Colors.grey
                                ),),
                                Text("${restaurant.restaurant[index]["km_from_destination"]}KM", style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey
                                ),),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
