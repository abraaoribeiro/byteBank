
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/loggin_interceptor.dart';



final HttpClientWithInterceptor client =  HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
const String baseUrl = "http://192.168.1.7:8080/transactions";

