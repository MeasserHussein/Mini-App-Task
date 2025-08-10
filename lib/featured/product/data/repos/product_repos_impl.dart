import 'package:dartz/dartz.dart';

import '../../../../core/dio_client/server_exception.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repos/product_repos.dart';
import '../data_source/product_remote_data_source.dart';


class ProductReposImpl extends ProductRepos{
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductReposImpl(this._productRemoteDataSource);
  @override
  Future<Either<ServerException, List<ProductEntity>>> getProduct() async{
    try{
      var data =await _productRemoteDataSource.getProduct();
      return Right(data);
    }catch(e){
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerException, ProductEntity>> getDetails(int id) async{
    try{
      var data =await _productRemoteDataSource.getDetails(id);
      return Right(data);
    }catch(e){
      return Left(ServerException(message: e.toString()));
    }
  }

}