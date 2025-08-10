import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naqla_task/core/units/extention.dart';


import 'bloc_builder_grid_view.dart';
import 'featured_image_grid_view.dart';
import 'featured_text_grid_view.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key,});


  @override
  Widget build(BuildContext context) {
    context.locale.languageCode;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.products),
        centerTitle: true,
      ),
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocBuilderGridView()
      ) ,
    );
  }
}
