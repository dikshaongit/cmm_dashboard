import 'package:cmm_insight/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget 
{
  LoginForm(this._onSignIn, this._setUserId, this._setPassword);
  final VoidCallback _onSignIn;
  final Function(String) _setUserId;
  final Function(String) _setPassword;
  final TextStyle _textStyle =TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) 
  {
    return Center(
      child: Container(
        padding: EdgeInsets.all(36),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _emailInput(),
            SizedBox(height: 25,),
            _passwordInput(),
            SizedBox(height: 35,),
            AppButton('Login', this._onSignIn),
          ],
        ),
      ),
    );
  }

  Widget _emailInput() 
  {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      child: TextField(
        onChanged: (value) => _setUserId(value.trim()),
        style: _textStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(
              gapPadding: 12.0, borderRadius: BorderRadius.circular(25.0)),
          labelText: 'Login Id',
        ),
      ),
    );
  }

  Widget _passwordInput() 
  {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      child: TextField(
        //validator: (value) => value.isEmpty ? 'Password is required' : null,
        onChanged: (value) => _setPassword(value.trim()),
        obscureText: true,
        style: _textStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(
              gapPadding: 12.0, borderRadius: BorderRadius.circular(25.0)),
          labelText: 'Password',
        ),
      ),
    );
  }
}
