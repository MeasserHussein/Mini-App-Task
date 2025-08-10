



import 'package:dartz/dartz.dart';

import '../../../../core/dio_client/server_exception.dart';
import '../entities/product_entity.dart';
import '../repos/product_repos.dart';

class ProductUseCase implements UseCase<List<ProductEntity>,NoParam>{
  final ProductRepos _productRepos;

  ProductUseCase(this._productRepos);
  @override
  Future<Either<ServerException, List<ProductEntity>>> call([NoParam? param]) async{
    return await _productRepos.getProduct();
  }

}



abstract class UseCase<T,Param>{
  Future<Either<ServerException,T>> call([Param param]);
}

class NoParam{}