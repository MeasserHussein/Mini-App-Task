

import 'package:dartz/dartz.dart';

import '../../../../core/dio_client/server_exception.dart';
import '../entities/product_entity.dart';

abstract class ProductRepos{
  Future<Either<ServerException,List<ProductEntity>>> getProduct();
  Future<Either<ServerException,ProductEntity>> getDetails(int id);
}