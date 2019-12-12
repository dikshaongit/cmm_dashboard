import 'package:cmm_insight/data/models/user.dart';
import 'package:cmm_insight/data/stores/poh_store.dart';
import 'package:cmm_insight/data/stores/user_store.dart';
import 'package:cmm_insight/locator.dart';
import 'package:cmm_insight/ui/views/list_view.dart';
import 'package:cmm_insight/ui/widgets/bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PohView extends StatelessWidget {
  static var finallevel=1;
  PohView(this._title, this._pohStore);
  final String _title;
  final PohStore _pohStore;
  User _user = locator<UserStore>().user;

  final TextStyle _textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0,fontWeight: FontWeight.w600, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text('$_title'),
              ),
            ),
           // Text('${_user.level} - ${_user.location}'),
          IconButton(                      
                      color: Colors.white,
                      iconSize: 30.0,
                      icon:Icon(Icons.insert_chart),                     
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Mygraph(_pohStore)));
                                         },
                    ) 
          ],
        ),
      ),
      body: Observer(
        builder: (_) {
          return Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _pohStore.colTags
                        .map((col) => Expanded(
                              child: Text('$col',style: _textStyle,),))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount:
                        (_pohStore.filteredRecord as List<PohSummary>).length,
                    itemBuilder: (context, index) => AnimatedOpacity(
                      opacity: 1.0,
                      duration: Duration(milliseconds: 500),
                      child: _PohSummaryItem(
                        pohSummaery: (_pohStore.filteredRecord
                            as List<PohSummary>)[index],
                        onTap:                     
                              _drillIn,                                           
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                )
              ],
            ),
          );
        },
      ),
     floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: _pohStore.drillOut,
      ),
    );
  }

 _drillIn(String tag,BuildContext context) 
  {    
    
  var x=_pohStore.drillIn(tag);   
  finallevel=x;
  if(finallevel==0)
  Navigator.push(context,MaterialPageRoute(builder: (context) => list_view( _pohStore),),);
  }
}

class _PohSummaryItem extends StatelessWidget {
  const _PohSummaryItem({
    Key key,
    @required PohSummary pohSummaery,
    @required Function onTap,
  })  : _item = pohSummaery,
        _onTap = onTap,
        super(key: key);

  final PohSummary _item;
  final Function(String,BuildContext) _onTap;
  final TextStyle _textStyle = const TextStyle(fontFamily: 'Montserrat',fontSize: 18.0,fontWeight: FontWeight.w400,color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Card(
        elevation: 10.0,
        child: InkWell(
          onTap: () => _onTap(_item.tag,context),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text('${_item.tag}', style: _textStyle, ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text('   ${_item.lhb}',style: _textStyle,),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text('${_item.icf}', style: _textStyle,),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text('${_item.other}',style: _textStyle, ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}