import 'package:dio/dio.dart';

abstract class RemoteApiRepo {
  Future<Response> getData(String endPoint);
}
