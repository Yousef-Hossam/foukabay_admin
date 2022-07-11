import 'package:dio/dio.dart';

import 'app_intercepor.dart';

class GetDio {
  Dio getDio() {
    return Dio()..interceptors.add(AppInterceptor());
  }
}