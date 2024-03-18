// import 'package:dio/dio.dart';

// class JwtInterceptor {
  
//   Dio dio = Dio();

//   JwtInterceptor() {
//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (RequestOptions options, RequestInterceptorHandler handler) {

//           options.headers["Authorization"] = "Bearer YourAccessToken";
//           return handler.next(options);
//         },
//         onResponse: (Response response, ResponseInterceptorHandler handler) {
          
//           return handler.next(response);
//         },
//         onError: (DioError error, ErrorInterceptorHandler handler) {
          
//           return handler.next(error);
//         },
//       )
//     );
//   }
// }