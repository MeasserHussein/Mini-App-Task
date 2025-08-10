import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class FontStyles {
  static TextStyle buildTextStyle({
    required BuildContext context,
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,

  }){
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: context.locale.languageCode=='en' ? 'Roboto' :'Almarai',
        color:color
    );
  }

  static TextStyle font20WeightRegular(BuildContext context)=>buildTextStyle(
      fontSize: 20.sp,
      context: context,
      fontWeight: FontWeight.w500,
    color: Colors.black
  );
  static TextStyle font18WeightReqular(BuildContext context)=>buildTextStyle(
      fontSize: 18.sp,
      context: context,
      fontWeight: FontWeight.w500,
    color: Colors.black
  );
  static TextStyle font16WeightReqular(BuildContext context)=>buildTextStyle(
      fontSize: 16.sp,
      context: context,
      fontWeight: FontWeight.w500,
    color: Colors.black
  );



}
