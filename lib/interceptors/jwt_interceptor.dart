// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:dub_tralers/services/_http_config.dart';
import 'package:dub_tralers/services/auth_service.dart';

class JwtInterceptor {
  
  Dio dio = Dio();
  AuthService authService = AuthService();

  JwtInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioError error, ErrorInterceptorHandler handler) async {
          if (error.response?.statusCode == 401 && error.response?.data['type'] == "EXPIRED_AT") {

            try {
              await authService.refreshToken();
              final response = await dio.request(
                error.requestOptions.path,
                options: Options(
                  method: error.requestOptions.method, 
                  headers: Http.getHeaders()
                ),
                data: error.requestOptions.data
              );
              return handler.resolve(response);
            } 
            catch (_) {
              try {
                await authService.logOut();

                final response = await dio.request(
                  error.requestOptions.path,
                  options: Options(
                    method: error.requestOptions.method, 
                    headers: Http.getHeaders()
                  ),
                  data: error.requestOptions.data
                );
                return handler.resolve(response);
              } 
              catch (_) {
                return handler.reject(error);
              }
            }
          }

          return handler.next(error);
        }
      )
    );
  }
}