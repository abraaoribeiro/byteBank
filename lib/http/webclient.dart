import 'package:flutter/widgets.dart';
import 'package:http/http.dart';


void findAll() async{
 final Response response = await get('http://192.168.0.165:8080/transactions');
debugPrint("Response");
debugPrint(response.body);
}
