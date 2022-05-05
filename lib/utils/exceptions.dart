import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.CANCEL:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        message = "Something Went Wrong";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        switch (dioError.response.statusCode) {
          case 400:
            message = "400 Bad Request";
            break;
          case 401:
            message = "Session Expired. Please login again";
            break;
          case 403:
            message = "Session Expired. Please login again";
            break;
          case 404:
            message = "404 Not Found";
            break;
          case 409:
            message = "409 Unknown Error";
            break;
          case 408:
            message = "408 Request TimeOut";
            break;
          case 500:
            message = "500 Internal Server Error";
            break;
          case 503:
            message = "503 Service Unavilable";
            break;
          default:
            message = "Unkonwn HTTP ERROR";
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String message;

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error["message"];
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
