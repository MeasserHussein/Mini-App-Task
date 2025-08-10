
import '../../../../core/dio_client/dio_client.dart';
import '../../../../core/dio_client/endpoints.dart';
import '../../domain/entities/product_entity.dart';
import '../model/product_model.dart';


abstract class ProductRemoteDataSource{
  Future<List<ProductEntity>> getProduct();
  Future<ProductEntity> getDetails(int id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{
  final DioClient _dioClient;

  ProductRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<ProductEntity>> getProduct() async{
    var response = await _dioClient.get(Endpoint.getProduct);
    if (response is List) {
      return response.map((json) => ProductModel.fromJson(json)).toList();
    }else {
      throw Exception('Invalid response format');
    }
  }

  @override
  Future<ProductEntity> getDetails(int id) async{
    var response = await _dioClient.get('${Endpoint.getProduct}/$id');
    return ProductModel.fromJson(response);
  }

}