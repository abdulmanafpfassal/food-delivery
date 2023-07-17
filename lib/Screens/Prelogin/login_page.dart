import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/Screens/Prelogin/phone_number_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';

import '../../Components/button.dart';
import '../../Helper/images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.banner),
          SizedBox(height: 10.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ACCOUNT",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 12.sp),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "Login/Create account to join the community",
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    button_text: "Login with Phone Number",
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return showPhoneNumberField(context);
                        },
                      );
                    }),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(height: 5.h,),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  endIndent: 10,
                  indent: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  child: Row(
                    children: [
                      Icon(Icons.local_offer_outlined, color: Colors.grey,),
                      SizedBox(width: 10.w,),
                      Text("Offers", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp
                      ),),
                      Spacer(),
                      Icon(IconlyLight.arrow_right_2, size: 15.sp, color: Colors.grey,)
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  child: Row(
                    children: [
                      Icon(Icons.mail_outline, color: Colors.grey,),
                      SizedBox(width: 10.w,),
                      Column(
                        children: [
                          Text("Send Feedback", style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp
                          ),),
                          Text("App version 1.0.0", style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 10.sp
                          ),),
                        ],
                      ),
                      Spacer(),
                      Icon(IconlyLight.arrow_right_2, size: 15.sp, color: Colors.grey,)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10.0),
        height: 20.h,
        child: Center(
          child: Text(
            "By clicking, I accept the Terms & Conditions and Privacy Policy",
            style: GoogleFonts.poppins(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          ),
        ),
      ),
    );
  }

}


