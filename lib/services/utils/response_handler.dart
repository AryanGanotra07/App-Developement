

import 'package:bluestacks/services/utils/exception_handler.dart';

class ResponseHandler {


  static const String USER_NOT_FOUND = "Resource not found!";
  static const String UNAUTHORIZED_ACCESS = "You are not authorized!";
  static const String BAD_REQUEST = "Invalid parameters provided!";
  static const String FETCH_DATA_EXCEPTION = "Error occurred while communication with server with statusCode";
  static const String INVALID_CREDENTIALS = "Username or password is invalid!";

  static void handleStatusCode(int statusCode) {
    switch(statusCode) {
      case 404:
        throw ResourceNotFoundException(USER_NOT_FOUND);
      case 401:
        throw InvalidInputException(INVALID_CREDENTIALS);
      case 403:
        throw UnauthorisedException(UNAUTHORIZED_ACCESS);
      case 400:
        throw BadRequestException(BAD_REQUEST);
      case 500:
      default:
        throw FetchDataException(
            '$FETCH_DATA_EXCEPTION : $statusCode');

    }
  }
}