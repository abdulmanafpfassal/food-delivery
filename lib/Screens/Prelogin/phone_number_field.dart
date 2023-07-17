import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/Components/button.dart';
import 'package:fooddelivery/Helper/utils.dart';
import 'package:fooddelivery/Screens/Prelogin/otp_verification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

showPhoneNumberField(BuildContext context){
  return Container(
    padding: EdgeInsets.all(10.0),
    height: getHeight(context)/2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Enter Phone Number", style: GoogleFonts.poppins(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 10.h,),
        IntlPhoneField(
          initialCountryCode: 'IN',
        ),
        SizedBox(height: 10.h,),
        CustomButton(button_text: "Continue", onTap: (){
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return otpVerification(context);
            },
          );
        })
      ],
    ),
  );
}