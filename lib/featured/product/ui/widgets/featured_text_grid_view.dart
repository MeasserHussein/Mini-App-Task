import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/text_responsive_lang.dart';
import '../../../../core/units/fuction/direction_method.dart';
import '../../../../core/units/styles.dart';

class FeaturedTextGridView extends StatelessWidget {
  const FeaturedTextGridView({super.key, required this.text, required this.textAgo,});

  final String text;
  final String textAgo;


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.only(
        top: 6.h,
        bottom: 8.h,
        left:6.w ,
        right: 6.w,
      ),
      child: Column(
        spacing: 6.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextResponsiveLang(
            overflow: ResponsiveLanguageText.getOverFlow(text),
            maxLines: 1,
            text: text,
            style: FontStyles.font18WeightReqular(context),
          ),
          TextResponsiveLang(
            maxLines: 1,
            text: textAgo,
            style: FontStyles.font16WeightReqular(context),
          ),

        ],
      ),
    );
  }
}
