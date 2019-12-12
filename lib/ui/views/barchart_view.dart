import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cmm_insight/data/models/series.dart';
import 'package:cmm_insight/data/stores/poh_store.dart';
import 'package:cmm_insight/ui/views/list_view.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<CoachSeries> data=List<CoachSeries>();
    BarChart(this._pohStore);
    final PohStore _pohStore;
    static var finallevel=1;

  @override
  
  Widget build(BuildContext context) {
  List<charts.Series<CoachSeries, String>> series = [
    charts.Series(
      id: "LHB",
      data: _pohStore.lhb_data,
      domainFn: (CoachSeries series, _) => series.date,
      measureFn: (CoachSeries series, _) => series.count,
      colorFn: (CoachSeries series, _) => series.barColor),
      charts.Series(
      id: "ICF",
      data: _pohStore.icf_data,
      domainFn: (CoachSeries series, _) => series.date,
      measureFn: (CoachSeries series, _) => series.count,
      colorFn: (CoachSeries series, _) => series.barColor),
      charts.Series(
      id: "OTHERS",
      data: _pohStore.others_data,
      domainFn: (CoachSeries series, _) => series.date,
      measureFn: (CoachSeries series, _) => series.count,
      colorFn: (CoachSeries series, _) => series.barColor),

  ];
  String tag;
    return Container(
        height: 400,
        padding: EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  " ",
                  style: Theme.of(context).textTheme.body2,
                ),
                Expanded(
                  child: charts.BarChart(
                    series,
                     animate: true,
                     domainAxis: new charts.OrdinalAxisSpec(
                       viewport:new charts.OrdinalViewport('AePS', 3),
                     ),
                     behaviors: [
                        new charts.SeriesLegend(),
                        new charts.SlidingViewport(),
                        new charts.PanAndZoomBehavior(),
                   ],
                   )
              )
            ],
          ),
        ),
      ),
    );  
}
}