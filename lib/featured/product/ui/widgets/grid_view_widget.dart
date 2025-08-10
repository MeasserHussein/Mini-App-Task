import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../../../core/units/app_route/app_routes.dart';
import '../../domain/entities/product_entity.dart';
import 'featured_image_grid_view.dart';
import 'featured_text_grid_view.dart';

class GridViewWidget extends StatelessWidget {
  final List<ProductEntity> products;
  const GridViewWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      horizontalGridSpacing: 0,
      verticalGridSpacing: 10.h,
      horizontalGridMargin: 0,
      verticalGridMargin: 0,
      minItemWidth: double.infinity,
      minItemsPerRow: 2,
      maxItemsPerRow: 2,
      children: List.generate(products.length, (index) {
        return GestureDetector(
          onTap: (){
            context.push(AppRoutes.details,extra: products[index]);
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.sp),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
            color:Colors.white,
            child: Column(
              children: [
                FeaturedImageGridView(
                  index: index,
                  imageText:products[index].productImage,
                ),
                FeaturedTextGridView(
                  text: products[index].name,
                  textAgo: 'Price: ${products[index].productPrice}',
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
