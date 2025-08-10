import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:naqla_task/core/units/extention.dart';

import '../../../../../core/units/styles.dart';
import 'bloc_builder_detals.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key,});


  @override
  Widget build(BuildContext context) {
    context.locale.languageCode;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.details),
        centerTitle: true,
      ),
      body: BlocBuilderDetails(),
    );
  }
}
