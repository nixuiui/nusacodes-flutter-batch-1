import 'package:dio/dio.dart';
import 'package:flutter_nusacodes/utils/loggin_iterceptor.dart';
import 'package:flutter_nusacodes/utils/network_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkService {

  final requestTimeOut = 30;
  
  late Dio dio;
  late SharedPreferences prefs;

  NetworkService() {
    final baseOptions = BaseOptions(
      baseUrl: 'http://localhost:8000',
      connectTimeout: Duration(seconds: requestTimeOut),
      receiveTimeout: Duration(seconds: requestTimeOut),
      responseType: ResponseType.json,
      followRedirects: true,
    );

    dio = Dio(baseOptions);
    dio.interceptors.add(LoggingInterceptor());
    initPref();
  }

  void initPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Map<String, dynamic> headersRequest() {
    final token = prefs.getString('token');
    return {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
    };
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? parameters,
  }) async {
    return await _safeFetch(() => dio.get(
      url,
      queryParameters: parameters ?? {},
      options: Options(headers: headersRequest()),
    ));
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _safeFetch(() => dio.post(
      url,
      data: data,
      options: Options(headers: headersRequest()),
      queryParameters: queryParameters
    ));
  }

  Future<Response> put({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _safeFetch(() => dio.put(
      url,
      data: data,
      options: Options(headers: headersRequest()),
      queryParameters: queryParameters,
    ));
  }

  Future<Response> patch({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _safeFetch(() => dio.patch(
      url,
      data: data,
      options: Options(headers: headersRequest()),
      queryParameters: queryParameters,
    ));
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>?  data,
    Map<String, dynamic>? parameters,
  }) async {
    return await _safeFetch(() => dio.delete(
      url,
      data: data,
      queryParameters: parameters,
      options: Options(headers: headersRequest()),
    ));
  }

  Future<Response> _safeFetch(Future<Response> Function() tryFetch) async {
    try {
      final response = await tryFetch();
      return response;
    } on DioException catch (dioError) {
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          throw NetworkException(message: "Connection Time Out");
        case DioExceptionType.sendTimeout:
          throw NetworkException(message: "Request Time Out");
        case DioExceptionType.receiveTimeout:
          throw NetworkException(message: "Response Time Out");
        case DioExceptionType.badResponse:
          throw NetworkException(response: dioError.response!);
        default:
          throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }
}
