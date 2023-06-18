import 'package:dio/dio.dart';

class CustomFailure {
  final String errMessage;
  CustomFailure(this.errMessage);

  factory CustomFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return CustomFailure('Connection Timeout, please try again.');
      case DioErrorType.sendTimeout:
        return CustomFailure('Send Timeout, please try again.');
      case DioErrorType.receiveTimeout:
        return CustomFailure('Recieve Timeout, please try again.');
      case DioErrorType.badCertificate:
        return CustomFailure('Bad Certificate, please try again.');
      case DioErrorType.cancel:
        return CustomFailure('request canceled, please try again.');

      case DioErrorType.badResponse:
        print('fail bad res error: ${dioError.error}');
        print('fail bad res message: ${dioError.message}');
        print('fail bad res response: ${dioError.response}');
        return CustomFailure.fromResponse(
            dioError.response?.statusCode, dioError.response);

      case DioErrorType.connectionError:
        print('fail conerr error: ${dioError.error}');
        print('fail conerr message: ${dioError.message}');
        print('fail conerr response: ${dioError.response}');
        return CustomFailure(
            'Oops there was an error, please try again later.');

      case DioErrorType.unknown:
        print('fail unknown error: ${dioError.error}');
        print('fail unknown message: ${dioError.message}');
        print('fail unknown response: ${dioError.response}');
        return CustomFailure(
            'Oops there was an error, please try again later.');

      default:
        return CustomFailure(
            'Oops there was an error, please try again later.');
    }
  }

  factory CustomFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return CustomFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return CustomFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return CustomFailure('Internal Server error, Please try later');
    } else {
      return CustomFailure('Opps There was an Error, Please try again');
    }
  }
}
