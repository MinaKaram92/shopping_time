import 'package:dio/dio.dart';
import 'package:shopping_time/core/network/remote/remote_api_repo.dart';

class RemoteApiRepoImpl implements RemoteApiRepo {
  final Dio _dio;
  RemoteApiRepoImpl(this._dio);
  static const _baseUrl = 'https://fakestoreapi.com/';

  @override
  Future<Response> getData(String endPoint) async {
    return await _dio.get('$_baseUrl$endPoint');
  }

  @override
  deleteData() {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  postData() {
    // TODO: implement postData
    throw UnimplementedError();
  }

  @override
  updateData() {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
