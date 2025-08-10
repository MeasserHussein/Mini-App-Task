import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/units/styles.dart';



class FeaturedImageGridView extends StatelessWidget {
  const FeaturedImageGridView({
    super.key,
    required this.index,
    required this.imageText,
  });

  final String imageText;

  final int index;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, url, error) => Image.asset(
        '',
        fit: BoxFit.cover,
      ),
    imageUrl: imageText,
    fit: BoxFit.cover,
    height: 120.h,
    width: double.infinity,

        );
  }
}
