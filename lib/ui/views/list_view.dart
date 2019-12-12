import 'package:cmm_insight/data/models/coachinfo.dart';
import 'package:cmm_insight/data/stores/poh_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

 
class list_view extends StatefulWidget
 {
  final PohStore _pohStore;
  list_view( this._pohStore);
  
  @override  
 _list_viewState createState() => new _list_viewState();
}
class _list_viewState extends State<list_view> 
{
   var items = List<coachinfo>();
   final TextEditingController editingController = new TextEditingController(); 
  
  @override
  void initState() 
  {
    items.addAll(widget._pohStore.coachlist);
    super.initState();
  }  
  
  void filterSearchResults(String query)
   {
    query=query.toUpperCase();
    List<coachinfo> dummySearchList = List<coachinfo>();
    dummySearchList.addAll(items);
    if(query.isNotEmpty) {
      List<coachinfo> dummyListData = List<coachinfo>();
      dummySearchList.forEach((item) {
        if(item.coach_number.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        widget._pohStore.coachlist.clear();
        widget._pohStore.coachlist.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        widget._pohStore.coachlist.clear();
        widget._pohStore.coachlist.addAll(items);
      });
    }
  }
  
  @override
   Widget build(BuildContext context)
   {
      return Scaffold(
       appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('COACH DETAILS',),
          ],
        ),
       ),
      body:  Container(
      child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                   filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
            ), 
     Expanded(child:        
      Observer(
        builder: (_) {
            return Center(
            child: Column(
              children: <Widget>[
               Expanded(
                    child:
                       ListView.separated(
                      itemCount:widget._pohStore.coachlist.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        AnimatedOpacity(opacity: 1.0,duration: Duration(milliseconds: 500),);                    
                        return new Card(                                  
                                      
                          elevation: 10.0,                          
                              child: ListTile(             
                                      title:Container(
                                              decoration:myBoxDecoration(widget._pohStore.coachlist[index].coach_category),    
                                               child:Column(
                                                 children: <Widget>[ 
                                                   Text("${widget._pohStore.coachlist[index].owning_rly}"+"-"+"${widget._pohStore.coachlist[index].coach_type}"+"-"+"${widget._pohStore.coachlist[index].coach_number}"
                                                                  ,style: new TextStyle(fontFamily: 'Montserrat',fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black)),                                           
                                              Row(
                                                  children: <Widget>[                                                                                            
                                                    Container(
                                                      padding: EdgeInsets.fromLTRB(60.0, 10.0, 10.0, 10.0),
                                                      child:Text("Depot:"+"\n"+"Division:" +"\n"+"Workshop:" +"\n"+"Built Date:"+"\n"+"Manufacturer:"+"\n"+"Maint Zone:"
                                                                  +"\n"+"Coach Age:"+"\n"+"Coach Category:"+"\n"+"Coach AC Flag:"+"\n"+"Vehicle Type:"+"\n"+"Return Date:",style: new TextStyle(fontSize: 15.0),),
                                                    ),
                                                    Container(                                                       
                                                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),                      
                                                      child:Column(
                                                        children: <Widget>[
                                                          Text("${widget._pohStore.coachlist[index].depot}"),
                                                          Text("${widget._pohStore.coachlist[index].division}"),
                                                          Text("${widget._pohStore.coachlist[index].workshop}"),
                                                          Text("${widget._pohStore.coachlist[index].built_date}"),
                                                          Text("${widget._pohStore.coachlist[index].manufacturer}"),                                                                   
                                                          Text("${widget._pohStore.coachlist[index].maint_zone}"),
                                                          Text("${widget._pohStore.coachlist[index].coach_age}"),
                                                          Text("${widget._pohStore.coachlist[index].coach_category}"),
                                                          Text("${widget._pohStore.coachlist[index].coach_ac_flag}"),
                                                          Text("${widget._pohStore.coachlist[index].vehicle_type}"),
                                                          Text("${widget._pohStore.coachlist[index].return_date}",style: new TextStyle(fontSize: 15.0),)
                                                        ],
                                                      )
                                                                                                             
                                                     ),
                                                  ]
                                               ),
                                                 ]
                                               ) 
                                    ),
                               ),                           
                         );                        
                       },
                        separatorBuilder: (BuildContext context, int index) => const Divider(),   
                    ),
               ),       
          ]
            ), 
            );
          }
       )
     ),
            
          ]
      )
      )
    );     
  }
}   

BoxDecoration myBoxDecoration(String type) 
{
  Color boxcolor;
  Color bordercolor;
  if(type=="ICF")
  {
  boxcolor=Colors.blue[50];
  bordercolor=Colors.blue;
  }
  else if(type=="LHB")
  {
  boxcolor=Colors.green[50];
  bordercolor=Colors.green;
  }
  
  else
  {
  boxcolor=Colors.red[50];
  bordercolor=Colors.red;
  }
  
    return BoxDecoration
    (
      color:boxcolor,
    border: Border.all(color: bordercolor,width: 5.0,),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
}