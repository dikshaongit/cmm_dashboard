import 'dart:async';
import 'dart:convert';
import 'package:cmm_insight/data/api/api.dart';
import 'package:cmm_insight/data/models/poh.dart';
import 'package:cmm_insight/data/models/token.dart';
import 'package:cmm_insight/data/models/user.dart';
import 'package:http/http.dart' as http;

class PohApi 
{
  Future<List<Poh>> pohArising(User user, Token token) async
   {     
    final response = await http.get(api_url + 'mobile/report/pohArising', headers: {"Accept": "application/json, text/plain, */*","Authorization": "${token.token_type} ${token.access_token}",},);
    if (response.statusCode == 200)
     {
         print(response.body);
      Iterable list = json.decode(response.body);
      List<Poh> pohList = list.map((m) => Poh.fromJson(m)).toList();
      return pohList;
     } 
    else
     {
      print(response.body);
      throw Exception('Failed to get data due to ${response.body}');
     }
   }
}