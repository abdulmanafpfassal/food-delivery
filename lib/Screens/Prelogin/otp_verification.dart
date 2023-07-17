import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/Components/button.dart';
import 'package:fooddelivery/Helper/utils.dart';
import 'package:fooddelivery/Screens/Dashboard/location_search_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';

otpVerification(BuildContext context){
  return Container(
    padding: EdgeInsets.all(10.0),
    height: getHeight(context)/2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Enter OTP", style: GoogleFonts.poppins(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 6.h,),
        Text("An OTP send to your registered Phone Number", style: GoogleFonts.poppins(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          color: Colors.grey
        ),),
        SizedBox(height: 10.h,),
        OTPTextField(
          length: 4,
          fieldWidth: 30,
          width: getWidth(context)/2,
        ),
        SizedBox(height: 30.h,),
        CustomButton(button_text: "Continue", onTap: (){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LocationSearch()), (route) => false);
        })
      ],
    ),
  );
}