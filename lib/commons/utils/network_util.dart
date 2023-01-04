import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_maintenance/commons/environment/environment.dart';
import 'package:get/get.dart' as get_x;
import 'package:logger/logger.dart';
import 'logger_util.dart';

class NetworkUtil {
  final logger = Logger(printer: LoggerUtil());
  final Dio _dio = get_x.Get.find<Dio>();

  Future<dynamic> post({
    String url = '',
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? bodyRaw,
    String? token,
    Encoding? encoding,
    Map<String, dynamic>? queryParameters
  }) async{
    if (!await _checkInternetConnection()) throw Exception(['NOT_INTERNET_EXCEPTION']);

    if(headers != null){
      _dio.options.headers.addAll(headers);
    }else{
      if (token != null) {
        _dio.options.headers.addAll({"Authorization" : "Bearer $token"});
      } else {
        _dio.options.headers.remove("Authorization");
      }
    }

    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.baseUrl = (baseUrl != null) ? baseUrl : Environment.appConfig["baseUrl"];

    logger.d("URL POST: ${(baseUrl == '') ? url : (Environment.appConfig["baseUrl"] + url)}");
    logger.d("Headers: ${_dio.options.headers.toString()}");
    logger.d("Body: ${(bodyRaw != null) ? bodyRaw.toString() : formData.toString()}");

    return _dio.post(url, data: bodyRaw ?? FormData.fromMap(formData!),
      options: Options(
        method: 'POST',
        responseType: ResponseType.json,
      ),
      queryParameters: queryParameters,
    ).then((Response response) {

      logger.d("Response [${response.statusCode}]: $response");

      return response.data;

    }).catchError((error){
      DioError dioError = error;
      logger.e("Error Response [${dioError.response!.statusCode}]: ${dioError.response}");
      return dioError.response!.data;
    }).timeout(Duration(milliseconds: _dio.options.connectTimeout), onTimeout: (){
      throw Exception(['TIME_OUT']);
    });
  }

  Future<dynamic> put({
    String url = '',
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? bodyRaw,
    String? token,
    Encoding? encoding,
    Map<String, dynamic>? queryParameters
  }) async{
    if (!await _checkInternetConnection()) throw Exception(['NOT_INTERNET_EXCEPTION']);

    if(headers != null){
      _dio.options.headers.addAll(headers);
    }else{
      if (token != null) {
        _dio.options.headers.addAll({"Authorization" : "Bearer $token"});
      } else {
        _dio.options.headers.remove("Authorization");
      }
    }

    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.baseUrl = (baseUrl != null) ? baseUrl : Environment.appConfig["baseUrl"];

    logger.d("URL PUT: ${(baseUrl == '') ? url : (Environment.appConfig["baseUrl"] + url)}");
    logger.d("Headers: ${_dio.options.headers.toString()}");
    logger.d("Body: ${(bodyRaw != null) ? bodyRaw.toString() : formData.toString()}");

    return _dio.put(url, data: bodyRaw ?? FormData.fromMap(formData!),
      options: Options(
        method: 'PUT',
        responseType: ResponseType.json,
      ),
      queryParameters: queryParameters,
    ).then((Response response) {

      logger.d("Response [${response.statusCode}]: $response");

      return response.data;

    }).catchError((error){
      DioError dioError = error;
      logger.e("Error Response [${dioError.response!.statusCode}]: ${dioError.response}");
      return dioError.response!.data;
    }).timeout(Duration(milliseconds: _dio.options.connectTimeout), onTimeout: (){
      throw Exception(['TIME_OUT']);
    });
  }

  Future<dynamic> get ({String url = '', String? baseUrl, Map<String, String>? headers, String? token, Encoding? encoding, Map<String, dynamic>? queryParameters}) async{

    if (!await _checkInternetConnection()) throw Exception(['NOT_INTERNET_EXCEPTION']);

    if (headers != null) {
      _dio.options.headers.addAll(headers);
    } else {
      if (token != null) {
        _dio.options.headers.addAll({"Authorization": "Bearer $token"});
      } else {
        _dio.options.headers.remove("Authorization");
      }
    }

    _dio.options.contentType = Headers.jsonContentType;

    _dio.options.baseUrl =
    (baseUrl != null) ? baseUrl : Environment.appConfig["baseUrl"];

    logger.d("URL GET: ${_dio.options.baseUrl + url}");
    logger.d("Headers: ${_dio.options.headers.toString()}");

    return _dio.get(url,
      options: Options(
          method: 'GET',
          responseType: ResponseType.json // or ResponseType.JSON
      ),
      queryParameters: queryParameters,
    ).then((Response response) {

      logger.d("Response [${response.statusCode}]: $response");

      return response.data;

    }).catchError((error){
      DioError dioError = error;
      logger.e("Error Response [${dioError.response!.statusCode}]: ${dioError.response}");
      return dioError.response!.data;
    }).timeout(Duration(milliseconds: _dio.options.connectTimeout), onTimeout: (){
      throw Exception(['TIME_OUT']);
    });
  }

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    logger.d("_checkInternetConnection -> $connectivityResult");
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
