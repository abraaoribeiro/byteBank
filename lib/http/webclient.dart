import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/loggin_interceptor.dart';

final HttpClientWithInterceptor client = HttpClientWithInterceptor.build(
  interceptors: [
    LoggingInterceptor(),
  ],
  requestTimeout: Duration(seconds: 5),
);
const String baseUrl = "http://192.168.1.7:8080/transactions";
