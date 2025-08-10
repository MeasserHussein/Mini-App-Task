import 'dart:ui';

import 'package:flutter/material.dart';

class ResponsiveLanguageText{

 static TextDirection getTextDirection(String text) {
    final isArabicText = RegExp(r'[\u0600-\u06FF]').hasMatch(text);

    if (isArabicText) {
      return TextDirection.rtl;
    } else {
      return TextDirection.ltr;
    }
  }
 static TextAlign getTextAlign(String text,) {
    final isArabicText = RegExp(r'[\u0600-\u06FF]').hasMatch(text);

    if (isArabicText) {
      return TextAlign.right;
    } else {
      return TextAlign.left;
    }
  }
 static Alignment getAlignment(String text) {
    final isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(text);
    return isArabic ? Alignment.centerRight : Alignment.centerLeft;
  }

 static TextOverflow  getOverFlow(String text){
    final isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(text);
    return isArabic? TextOverflow.ellipsis :TextOverflow.ellipsis;
  }


}