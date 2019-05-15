import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/history.dart';

Future<List<History>> getHistory() async{
  final String baseUrl = "http://api.juheapi.com/japi/toh";
  DateTime datetime = DateTime.now();
  int day = datetime.day;
  int month = datetime.month;
  final String reqUrl = baseUrl + "?v=1.0&month=" + month.toString() + "&day=" + day.toString() + "&key=e9bb8a29cd7e119a4ad4a8b7f09ca1d9";
  var response = await http.get(reqUrl);
  if (response.statusCode == 200) {
    var jsonRespone = json.decode(response.body);
    if (jsonRespone['error_code'] == 0) {
      var results = jsonRespone["result"] as List;
      return results.map((data) => History.fromJSON(data)).toList();
    } else {
      throw Exception(jsonRespone['reason']);
    }
  } else {
    throw Exception("Connection Failed");
  }
}