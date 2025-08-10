import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/product_cubit/product_cubit.dart';
import 'grid_view_widget.dart';

class BlocBuilderGridView extends StatelessWidget {
  const BlocBuilderGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductState>(builder:(context,state){
      if (state is ProductSuccess) {
        return GridViewWidget(products: state.products ?? [],);
      }else if(state is ProductError){
        return Center(child: Text(state.errorMessage),);
      }else{
        return Center(child: CircularProgressIndicator());
      }
    }) ;
  }
}
