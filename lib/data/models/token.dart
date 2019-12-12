class Token {
  String access_token;
  String token_type;
  String refresh_token;
  int expires_in;
  String scope;

  Token.fromJson(Map<String, dynamic> json) {
    access_token = json['access_token'];
    token_type = json['token_type'];
    refresh_token = json['refresh_token'];
    expires_in = json['expires_in'];
    scope = json['scope'];
    
  }
}
