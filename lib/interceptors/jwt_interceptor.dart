// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class JwtInterceptor {
  
  Dio dio = Dio();

  JwtInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print("OK");
          return handler.next(response);
        },
        onError: (DioError error, ErrorInterceptorHandler handler) {
          
          return handler.next(error);
        },
      )
    );
  }
}