import 'dart:convert';
import 'dart:io';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/model/Error.dart';
import 'package:delivery_food/model/Subcategory_model.dart';
import 'package:http/http.dart' as http;

class SubcategoryService {
  Future<ApiResult> getsubcategoryData(int idcategory) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<SubcategoryResponse> calendar = [];
    SubcategoryStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http(
        '${statusCode.url1}',
        '/api/public/category/$idcategory/sub-category',
        {'lang': statusCode.Lang});

    try {
      var response = await http.get(url);
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = SubcategoryStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          for (var item in responsebode['response']) {
            calendar.add(SubcategoryResponse.fromJson(item));
          }
          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = SubcategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = SubcategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = SubcategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = SubcategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = SubcategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = SubcategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = SubcategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = SubcategoryStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print(' error Please try again');
      }
    } on SocketException {
      apiResult.errorMassage = 'Make sure you are connected to the internet';
      apiResult.codeError = statusCode.connection;
      apiResult.hasError = true;
      print('Make sure you are connected to the internet');
    } on FormatException {
      apiResult.errorMassage = 'There is a problem with the admin';
      apiResult.codeError = statusCode.parsing;
      apiResult.hasError = true;
      print('There is a problem with the admin');
    } catch (e) {
      apiResult.errorMassage = '?????? ?????? ?????? ??????????';
      apiResult.codeError = statusCode.connection;
      apiResult.hasError = true;
      print('${e}');
    }
    return apiResult;
  }
}
