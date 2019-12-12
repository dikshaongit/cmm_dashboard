import 'package:cmm_insight/data/models/token.dart';

class TokenStore 
{
  Token _token;
  void storeToken(Token _token) => this._token = _token;
  get token => _token;
  void destroyToken() => this._token = null;
}
