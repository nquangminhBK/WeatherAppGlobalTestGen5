import 'dart:async';



import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_global_test_gen5/consts/api_consts.dart';

enum DioMethod {
  post,
  get,
  delete,
  put,
}

class AppDio {
  static AppDio _instance = AppDio();
  Dio dio = Dio();
  Dio tokenDio = Dio();
  bool isRefreshed = false;

  AppDio._internal();

  AppDio();

  static AppDio getInstance() {
    _instance = AppDio._internal();
    _instance.dio = Dio();
    _instance.tokenDio = Dio();
    return _instance;
  }

  Future<AppDio> getAppDio() async {
    BaseOptions options = BaseOptions(
      baseUrl: BASE_URL,
      contentType: 'application/json',
      connectTimeout: TIME_OUT,
      sendTimeout: TIME_OUT,
      receiveTimeout: TIME_OUT,
    );
    dio.options = options;
    dio.httpClientAdapter = DefaultHttpClientAdapter();
    return this;
  }

  Future<AppDio> getAppDioWithNoBaseURL() async {
    BaseOptions options = BaseOptions(
      contentType: 'application/x-www-form-urlencoded',
      connectTimeout: TIME_OUT,
      sendTimeout: TIME_OUT,
      receiveTimeout: TIME_OUT,
    );
    dio.options = options;
    dio.httpClientAdapter = DefaultHttpClientAdapter();
    return this;
  }

  Future<Response<dynamic>> sendPostRequest(
      {required String apiPath,
      required Map<String, dynamic> param,
      required bool hasToken,
      Options? options,
      bool returnRes = false}) async {
    try {
      print("------- Request api: $apiPath -------");

      final response = await dio.post(apiPath, data: param, options: options);

      print(
          "------- Response api: $apiPath  token: ${dio.options.headers["Authorization"]} - data: $response -------");

      // return await _response(response, apiPath, param, DioMethod.post);
      return response;
    } on DioError catch (error) {
      throw (error);
    }
  }

  Future<Response<dynamic>> sendFormData({
    required String apiPath,
    required FormData data,
    Options? options,
  }) async {
    try {
      print("------- Request api: $apiPath -------");
      FormData formData = data;

      final response =
          await dio.post(apiPath, data: formData, options: options);
      print(
          "------- Response api: $apiPath  token: ${dio.options.headers["Authorization"]} - data: $response -------");
      // return await _response(response, apiPath, param, DioMethod.post);
      return response;
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw (error);
    }
  }

  Future<Response<dynamic>> sendGetRequest(
      String apiPath, Map<String, dynamic> param, bool hasToken,
      {bool? loading, bool returnRes = false}) async {
    try {
      print("------- Request api: $apiPath-------");
      final response = await dio.get(apiPath, queryParameters: param);
      print("------- Response api: $apiPath data: ${response.data} -------");
      return response;
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw (error);
    }
  }

  bool _checkConnectionError(e) {
    if (e.toString().contains('SocketException') ||
        e.toString().contains('HandshakeException')) {
      return true;
    } else {
      return false;
    }
  }

  Future<Response<dynamic>> sendUploadFile(
      {required String apiPath,
      required FormData data,
      required bool hasToken,
      bool? loading,
      Options? options,
      Function? onProgess}) async {
    try {
      print("------- Request api: $apiPath -------");
      FormData formData = data;
      print('---------- formData Fields : ${formData.fields}');

      final response = await dio.post(apiPath, data: formData, options: options,
          onSendProgress: (actualByte, totalByte) {
        onProgess!(actualByte, totalByte);
      });
      print(
          "------- Response api: $apiPath  token: ${dio.options.headers["Authorization"]} - data: $response -------");
      // return await _response(response, apiPath, param, DioMethod.post);
      return response;
    } on DioError catch (error) {
      throw (error);
    }
  }

  Future<Response<dynamic>> sendPutRequest(
      {required String apiPath,
      required Map<String, dynamic> param,
      Options? options,
      bool returnRes = false}) async {
    try {
      print("------- Request api: $apiPath -------");
      Map<String, dynamic> params = param;

      final response = await dio.put(apiPath, data: params, options: options);

      print(
          "------- Response api: $apiPath  token: ${dio.options.headers["Authorization"]} - data: $response -------");

      // return await _response(response, apiPath, param, DioMethod.post);
      return response;
    } on DioError catch (error) {
      throw (error);
    }
  }
}
