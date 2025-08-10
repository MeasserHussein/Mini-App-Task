import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/product_entity.dart';
import '../../../domain/use_case/signup_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productUseCase) : super(ProductInitial());
  final ProductUseCase _productUseCase;

  Future<void> getProduct()async{
    emit(ProductLoading());
    var data=await _productUseCase.call();
    data.fold((error){
      emit(ProductError(error.message!));
    }, (products){
      emit(ProductSuccess(products));
    });
  }
}
