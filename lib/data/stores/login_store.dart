import 'package:cmm_insight/data/api/auth_api.dart';
import 'package:cmm_insight/data/models/token.dart';
import 'package:cmm_insight/data/stores/token_store.dart';
import 'package:cmm_insight/data/stores/user_store.dart';
import 'package:cmm_insight/locator.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

enum LoginState {
  AUTHENTICATED,
  UNAUTHENTICATED,
  INPROGRESS,
  AUTHENTICATION_ERROR
}

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  LoginState loginState = LoginState.UNAUTHENTICATED;

  @observable
  String userId;

  @observable
  String password;

  @observable
  bool isError = false;

  @observable
  List<String> errors;

  @action
  authenticate() async {
    loginState = LoginState.INPROGRESS;
    await validate();
    if (isError) {
      loginState = LoginState.AUTHENTICATION_ERROR;
    } else {
      try {
        Token token = await AuthoricationApi().authenticate(userId, password);
        
        if (token != null) {
          locator<TokenStore>().storeToken(token);

          await locator<UserStore>().loadUser(token);

          loginState = LoginState.AUTHENTICATED;
        } else {
          loginState = LoginState.AUTHENTICATION_ERROR;
        }
      } on Exception catch (e) {
        loginState = LoginState.AUTHENTICATION_ERROR;
        isError = true;
        errors = new List();
        errors.add('Login Failed due to ==> $e');
      }
    
    }
  }

  @action
  logout() async {
    loginState = LoginState.INPROGRESS;
    isError = false;
    userId = null;
    password = null;

    locator<TokenStore>().destroyToken();
    locator<UserStore>().destroy();

    loginState = LoginState.UNAUTHENTICATED;
  }

  @action
  validate() async {
    isError = false;
    errors = new List();
    if (!isValidUserId()) {
      isError = true;
      errors.add('User Id is required');
    }
    if (!isValidPassword()) {
      isError = true;
      errors.add('Password is required');
    }
  }

  bool isValidPassword() {
    return password?.isNotEmpty ?? false;
  }

  bool isValidUserId() {
    return userId?.isNotEmpty ?? false;
  }
}
