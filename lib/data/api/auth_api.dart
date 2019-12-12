import 'dart:async';
import 'dart:convert';
import 'package:cmm_insight/data/api/api.dart';
import 'package:cmm_insight/data/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:cmm_insight/data/models/token.dart';

class AuthoricationApi
 {
  static const String authorization = 'Basic Y21tOmNtbUBjcmlzLm9yZy4xbg==';
  static const token_header = {"Accept": "application/json, text/plain, */*","Authorization": "$authorization","Content-Type": "application/x-www-form-urlencoded"};

  Future<Token> authenticate(String userId, String password) async {
    print('to call');  
    final response = await http.post(auth_url + 'oauth/token',body: 'grant_type=password&username=$userId&password=$password',headers: token_header,);
    if (response.statusCode == 200) 
    {
      print(response.body);
      return Token.fromJson(json.decode(response.body));
    } 
    else 
    {
      print(response.body);
      throw Exception('Failed to Login due to ${response.statusCode}');
    }
  }

  Future<User> loadUser(Token token) async {
    print('to call user');
    final response = await http.get(user_url + 'userinfo',headers: {"Accept": "application/json, text/plain, */*","Authorization": "${token.token_type} ${token.access_token}",},);    
    if (response.statusCode == 200)
     {
     print(response.body);
      return User.fromJson(json.decode(response.body));
    }
     else 
     {
      print(response.body);
      throw Exception('Failed to get User due to ${response.body}');
    }
  }
}
