
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '/src/utils/const/app_specifications/allDirectories.dart';
import '/src/domain/local/donneebydateForBad.dart';


class ChartForReportingBAD extends StatefulWidget  {
  final Iterable<DonneeByDateFromVolumetrieBAD> data;
 // final List<DonneeByDateFromVolumetrieBAD> data;
  const ChartForReportingBAD({Key? key, required this.data}) : super(key: key);

  @override
  State<ChartForReportingBAD> createState() => _ChartForReportingBADState();
}

class _ChartForReportingBADState extends State<ChartForReportingBAD> {
  List<_ChartData> conteneurData=[];

  late TooltipBehavior _tooltip;

  List<String> listNomMois=[];
  List<String> listNomMoisRefactoring=[];


  getData(Iterable<DonneeByDateFromVolumetrieBAD> data){
    for (int i = 0; i < widget.data.length; i++) {
      conteneurData.add(_ChartData(widget.data.elementAt(i).dateTraitement.substring(8,10), widget.data.elementAt(i).count));
    //  conteneurData.add(_ChartData(widget.data[i].dateTraitement.substring(8,10), widget.data[i].count));
    }
  }


  @override
  void initState() {
    getData(widget.data);

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: AppDimensions.sizeboxHeight20),
          padding: EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          child:
              SfCartesianChart(
                  legend:Legend(
                    isVisible: true,
                    position: LegendPosition.top,

                  ),
                  primaryXAxis: CategoryAxis(),
                  // primaryYAxis: NumericAxis(minimum: 0,  maximum: 1700, interval: 500),
                  primaryYAxis: NumericAxis(),
                  tooltipBehavior: _tooltip,
                  series: <CartesianSeries<_ChartData, String>>[
                    LineSeries<_ChartData, String>(
                        color: AppColors.mainGreenColor,
                        dataSource: conteneurData,
                        name: 'Total BAD Journalier',
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y
                    ),
                  ]
              ),
        ),
        Container(
          margin: EdgeInsets.only(top: AppDimensions.sizeboxHeight20),
          padding: EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          child:
              SfCartesianChart(
                  legend:Legend(
                    isVisible: true,
                    position: LegendPosition.top,

                  ),
                  primaryXAxis: CategoryAxis(),
                  // primaryYAxis: NumericAxis(minimum: 0,  maximum: 1700, interval: 500),
                  primaryYAxis: NumericAxis(),
                  tooltipBehavior: _tooltip,
                  series: <CartesianSeries<_ChartData, String>>[
                   ColumnSeries<_ChartData, String>(
                        dataSource: conteneurData,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: 'Total BAD Journalier',
                        color: Color(0xff474ce5)
                    ),

                  ]
              ),
        ),
      ],
    );
  }
}

class _ChartData {
  final String x; // Month names
  final int y;    // Data value (numeric)

  _ChartData(this.x, this.y);

}