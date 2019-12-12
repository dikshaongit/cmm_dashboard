import 'package:cmm_insight/data/api/auth_api.dart';
import 'package:cmm_insight/data/models/token.dart';
import 'package:cmm_insight/data/models/user.dart';

class UserStore {
  User _user;

  get user => _user;

  loadUser(Token token) async {
    _user = await AuthoricationApi().loadUser(token);
  }

  void destroy() => _user = null;
}
