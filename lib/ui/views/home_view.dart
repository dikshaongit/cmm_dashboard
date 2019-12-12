import 'package:cmm_insight/data/models/user.dart';
import 'package:cmm_insight/data/stores/login_store.dart';
import 'package:cmm_insight/data/stores/poh_store.dart';
import 'package:cmm_insight/data/stores/user_store.dart';
import 'package:cmm_insight/locator.dart';
import 'package:cmm_insight/ui/views/poh_view.dart';
import 'package:cmm_insight/ui/widgets/board_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> 
{
  PohStore _pohDueStore = locator<PohStore>();
    LoginStore _loginStore = locator<LoginStore>();
    UserStore _userStore = locator<UserStore>();

  @override
  void initState() {
    super.initState();
    _pohDueStore.initialize(PohCategory.DUE);
  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
  @override
  Widget build(BuildContext context) {    
    User _user = _userStore.user;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text('CMM-Dashboard'),
              ),
            ),
            Text('${_user.level} - ${_user.location}')
          ],
        ),
      ),
      body: Center(
        child: Card(
          elevation: 10,
          child: Container(
            height: 100,
            color: Colors.yellowAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Observer(
                    builder: (_) => BoardItem(
                      _pohDueStore.total,
                      'POH Booked',
                      Colors.green.shade300,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PohView('POHDue', _pohDueStore),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: BoardItem(10, 'POH Due', Colors.blue[300], null),
                ),
                Expanded(
                  child: BoardItem(100, 'POH Overdue', Colors.red, null),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: () {
          _loginStore.logout();
          if (_loginStore.loginState == LoginState.UNAUTHENTICATED) {
            Navigator.pushReplacementNamed(context, 'login');
          }
        },
      ),
    );
  }

 
}
