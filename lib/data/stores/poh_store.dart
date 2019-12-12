import 'package:cmm_insight/data/api/poh_api.dart';
import 'package:cmm_insight/data/models/poh.dart';
import 'package:cmm_insight/data/models/series.dart';
import 'package:cmm_insight/data/models/state_constants.dart';
import 'package:cmm_insight/data/models/token.dart';
import 'package:cmm_insight/data/models/user.dart';
import 'package:cmm_insight/data/stores/token_store.dart';
import 'package:cmm_insight/data/stores/user_store.dart';
import 'package:cmm_insight/locator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import "package:collection/collection.dart";
import 'package:cmm_insight/data/models/coachinfo.dart';
import 'package:charts_flutter/flutter.dart' as charts;
part 'poh_store.g.dart';


enum PohCategory { BOOKED, DUE, OVERDUE }

class PohSummary
 {
  String tag;
  int lhb;
  int icf;
  int other;
}

class PohStore = _PohStore with _$PohStore;

abstract class _PohStore with Store
 {
  @observable
  ApiState state = ApiState.NOT_LOADED;

  @observable
  bool isError = false;

  @observable
  List<String> errors;

  @observable
  List<Poh> pohList;

  @observable
  Map<String, List<Poh>> _map;
  List<Map<String, List<Poh>>> _stack = List<Map<String, List<Poh>>>();
  List<String> _fileterLevels = ['return_date','maint_zone','division','depot'];
  List<coachinfo> coachlist= List<coachinfo>();
  List<coachinfo> lhb= List<coachinfo>();
  List<coachinfo> icf= List<coachinfo>();
  List<coachinfo> others= List<coachinfo>();  
  List<CoachSeries> lhb_data = new List<CoachSeries>();
  List<CoachSeries> icf_data = new List<CoachSeries>();
  List<CoachSeries> others_data = new List<CoachSeries>();


  @observable
  int _currentLevel = 0;

  @observable
  List<String> colTags;

  @action
  initialize(PohCategory category) async
   {
    User _user = locator<UserStore>().user;
    Token _token = locator<TokenStore>().token;
    state = ApiState.LOADING;
    try {
      switch (category) 
      {
        case PohCategory.BOOKED:
          print('BOOKED');
          break;
        case PohCategory.DUE:
          print('DUE');
          pohList = await PohApi().pohArising(_user, _token);
          break;
        case PohCategory.OVERDUE:
          print('OVERDUE');
          break;
      }
      state = ApiState.LOADED;
      _init();
    } on Exception catch (e)
     {
      state = ApiState.API_ERROR;
      isError = true;
      errors = new List();
      errors.add('Failed due to ==> $e');
    }
  }  

  @action
  _init()
   {
    colTags = [_fileterLevels[_currentLevel].toUpperCase(),'LHB','ICF','OTHERS'];
    User _user = locator<UserStore>().user;
    switch (_user.level) 
    {
      case 'BOARD':
        break;
      case 'DIVISION':
        break;
    }
    _map = groupBy<Poh, String>(pohList, (Poh poh) => poh.data[_fileterLevels[_currentLevel]]);
  }

  @action
  drillIn(String tag) 
  {
    var result;
    if (_currentLevel < 3) 
    {
      _currentLevel++;
      _stack.add(_map);
      colTags[0] = _fileterLevels[_currentLevel].toUpperCase();
      _map = groupBy<Poh, String>(
        _map[tag], (Poh poh) => poh.data[_fileterLevels[_currentLevel]]);
        result=1;         
    }
    else
    {
      coachlist.removeRange(0, coachlist.length);
      _map = groupBy<Poh, String>(_map[tag], (Poh poh) => poh.data[_fileterLevels[_currentLevel]]);

      var l=_map.values;
      for (var  i in l)
      {
            for( var j in i)
            {
              var x=coachinfo.fromjson(j.data);           
            
                  coachlist.add(x);  
            }       
      }
        lhb = coachlist.where((o) => o.coach_category== "LHB").toList();
        icf = coachlist.where((o) => o.coach_category== "ICF").toList();
        others=coachlist.where((o) =>(o.coach_category!="ICF" && o.coach_category!="LHB")).toList();
        coachlist.removeRange(0, coachlist.length);
        coachlist.addAll(lhb);
        coachlist.addAll(icf);
        coachlist.addAll(others);
        result=0;      
    }     
    return result;
    
  }

  @action
  drillOut()
   {
    if (_currentLevel > 0) 
    {
      _currentLevel--;
      colTags[0] = _fileterLevels[_currentLevel].toUpperCase();
      _map = _stack.removeLast();
    }
  }

  @computed
  get filteredRecord
   {   
     List<PohSummary> records = List<PohSummary>();
        lhb_data.removeRange(0, lhb_data.length);
        icf_data.removeRange(0, icf_data.length);
        others_data.removeRange(0, others_data.length);
     _map.keys.forEach(
      (k) {
        PohSummary record = PohSummary();
        CoachSeries lhb_datas= CoachSeries();
        CoachSeries icf_datas= CoachSeries();
        CoachSeries others_datas= CoachSeries();
        others_datas.date=icf_datas.date=lhb_datas.date=record.tag = k;
        lhb_datas.count=record.lhb =_map[k].where((poh) => poh.data['coach_category'] == 'LHB').length;
        lhb_datas.barColor=charts.ColorUtil.fromDartColor(Colors.green);
        icf_datas.count=record.icf =_map[k].where((poh) => poh.data['coach_category'] == 'ICF').length;
        icf_datas.barColor=charts.ColorUtil.fromDartColor(Colors.blue);
        others_datas.count=record.other = _map[k].length - (record.lhb + record.icf);
        others_datas.barColor=charts.ColorUtil.fromDartColor(Colors.red);
        lhb_data.add(lhb_datas);
        icf_data.add(icf_datas);
        others_data.add(others_datas);
        records.add(record);
        print('${record.tag}-${record.lhb}-${record.icf}-${record.other}-${_map[k].length} of ${pohList.length}');              },

    );

    return records;
  }

  @computed
  get total => pohList?.length ?? 0;
  get currentLevel => _currentLevel;
}