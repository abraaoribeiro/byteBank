import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
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

Future<List<Transaction>> findAll() async {
  final HttpClientWithInterceptor client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

  final Response response = await get('http://192.168.1.7:8080/transactions');
  final List<dynamic> decodeJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];

  for (Map<String, dynamic> element in decodeJson) {
    final Map<String, dynamic> contactJson = element['contact'];
    final Transaction transaction = Transaction(
      element['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }

  return transactions;
}
