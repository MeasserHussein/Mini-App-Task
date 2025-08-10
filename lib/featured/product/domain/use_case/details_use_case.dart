
import 'package:dartz/dartz.dart';
import 'package:naqla_task/featured/product/domain/use_case/signup_use_case.dart';

import '../../../../core/dio_client/server_exception.dart';
import '../entities/product_entity.dart';
import '../repos/product_repos.dart';

class DetailsUseCase implements UseCase<ProductEntity,int>{
  final ProductRepos _productRepos;

  DetailsUseCase(this._productRepos);
  @override
  Future<Either<ServerException, ProductEntity>> call([int? id]) async{
    return await _productRepos.getDetails(id!);
  }
}