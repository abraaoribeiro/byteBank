import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
      return data;
  }
}
void findAll() async{
  HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
 final Response response = await get('http://192.168.1.7:8080/transactions');
}
