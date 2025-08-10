import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/units/styles.dart';
import '../../manager/details_cubit/details_cubit.dart';

class BlocBuilderDetails extends StatelessWidget {
  const BlocBuilderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsSuccess) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      errorWidget: (context, url, error) =>
                          Image.asset('', fit: BoxFit.cover),
                      imageUrl: state.productEntity.productImage,
                      fit: BoxFit.contain,
                      height: 200.h,
                      width: double.infinity,
                    ),
                    Text(
                      state.productEntity.name,
                      style: FontStyles.font20WeightRegular(context).copyWith(
                        color: Colors.blue
                      ),
                    ),
                    Text(
                      state.productEntity.productPrice.toString(),
                      style: FontStyles.font18WeightReqular(context),
                    ),
                    Column(
                      children: [
                        Text(
                          state.productEntity.details,
                          style: FontStyles.font18WeightReqular(context).copyWith(
                            color: Colors.black.withValues(alpha: 0.6)
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is DetailsError) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
