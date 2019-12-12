import 'package:cmm_insight/data/stores/login_store.dart';
import 'package:cmm_insight/locator.dart';
import 'package:cmm_insight/ui/widgets/login_form.dart';
import 'package:cmm_insight/ui/widgets/overlay_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatelessWidget {
  LoginStore _loginStore = locator<LoginStore>();

  final TextStyle _errorTextStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.red);

  @override
  Widget build(BuildContext context)
   {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CMM LOGIN'),          
        ),
       ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return _loginStore.isError? Column(mainAxisAlignment: MainAxisAlignment.end,children: showError(),): Container();
                    },
                  ),
                  LoginForm(() async {
                    await _loginStore.authenticate();
                    if (_loginStore.loginState == LoginState.AUTHENTICATED) {
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  }, _setUserId, _setPassword)
                ],
              ),
            ),
            Observer(
              builder: (_) {
                return _loginStore.loginState == LoginState.INPROGRESS ? OverlayProgress(): Container();
              },
            )
          ],
        ),
      ),
    );
  }

  showError() {
    return _loginStore.errors
        .map((err) => Text(
              '$err',
              style: _errorTextStyle,
            ))
        .toList();
  }

  _setUserId(String userId) {
    _loginStore.userId = userId;
  }

  _setPassword(String password) {
    _loginStore.password = password;
  }
}

