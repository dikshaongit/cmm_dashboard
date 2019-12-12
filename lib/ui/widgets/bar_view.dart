import 'package:cmm_insight/data/stores/poh_store.dart';
import 'package:cmm_insight/ui/views/barchart_view.dart';
import 'package:flutter/material.dart';
class Mygraph extends StatelessWidget
{  
    Mygraph(this._pohStore);
    final PohStore _pohStore;
      
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[Expanded(child: 
            Center( child: Text('Graph Chart'),),
          ),
          IconButton(
            color: Colors.white,
            iconSize: 30.0,
            icon: Icon(Icons.grid_on),
            onPressed: () {
              Navigator.pop(context);
            },
            ),
          ],
        ),
         leading: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.open_in_new),
      ),
      body: Center(
        child: BarChart(
      _pohStore,
    )),
    );
  }

}