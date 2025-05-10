
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../Src/utils/const/app_specifications/app_dimensions.dart';
import '/src/utils/const/app_specifications/app_colors.dart';
import '/src/utils/const/routes/app_routes_name.dart';

class DashboardOrbusPage extends StatefulWidget {
  const DashboardOrbusPage({super.key});

  @override
  State<DashboardOrbusPage> createState() => _DashboardOrbusPageState();
}
class _DashboardOrbusPageState extends State<DashboardOrbusPage> {
  DateTime selectedDate = DateTime.now();
  List<ChartData> dossierData=[];
  List<ChartData> dossierFixeData=[];
  late TooltipBehavior _tooltip;
  List<int> dossiers=[0,100,300,200,400];
  List<int> limiteFixe=[300,300,300,300,300];
  List<String> heures=['1h','2h','3h','4h','5h'];

  List<int> dossiersForPieSerie=[50,10,15,25];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  getData(List<String> data){
    dossierData.clear();
    for (int i = 0; i < data.length; i++) {
      dossierData.add(ChartData(data.elementAt(i), dossiers.elementAt(i)));
      //  conteneurData.add(_ChartData(widget.data[i].dateTraitement.substring(8,10), widget.data[i].count));
    }
  }

  getDossierFixe(List<String> data){
    dossierFixeData.clear();
    for (int i = 0; i < data.length; i++) {
      dossierFixeData.add(ChartData(data.elementAt(i), limiteFixe.elementAt(i)));
      //  conteneurData.add(_ChartData(widget.data[i].dateTraitement.substring(8,10), widget.data[i].count));
    }
  }

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    getData(heures);
    getDossierFixe(heures);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dateString = DateFormat('dd/MM/yyyy').format(selectedDate);

    List<String> filtreNames=["Période", "Du","Au"];
    List<String> filtreValues=['Ce-mois', '06/05/2024','06/05/2024'];
    List<String> filtreIcons=['ion_caret-down-outline','Icon','Icon'];

    List<String> titles=["DRAV", "Assurances","Pôles publics","Banques",];
    List<String> icons=['📑','🏢','🏛️','🏦'];
    List<int> count=[27,59,10,23,37,16];
    List<Color> countColors= [Color(0xFF2C5F9E), Color(0xFFE74C3C), Color(0xFF9B59B6), Color(0xFFF39C12)];

    return  Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/13,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  itemCount:filtreNames.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(15),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        //mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //spacing: 10,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 3,
                            children: [
                              Text(filtreNames[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(filtreValues[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF666666),
                                  fontSize: 18,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset("asset/images/${filtreIcons[index]}.svg")
                        ],
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,//nbre de colone
                    childAspectRatio: 4 / 1.3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height/3.3,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  itemCount:titles.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap:(){Navigator.of(context).pushNamed(AppRoutesName.polePublicOrbus);},
                        child: DossierCard(
                          title: titles[index],
                          icon: icons[index],
                          count: count[index],
                          countColor: countColors[index],
                        )
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,//nbre de ligne
                    childAspectRatio: 4 / 1.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                ),
                height: MediaQuery.of(context).size.height/3.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre de dossiers',
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          title: AxisTitle(text: 'Heure'),
                        ),
                        primaryYAxis: NumericAxis(
                          title: AxisTitle(text: 'Nombre'),
                        ),
                        series: <ChartSeries>[
                          LineSeries<ChartData, String>(
                            dataSource: dossierFixeData,
                            xValueMapper: (ChartData data, _) => data.hour,
                            yValueMapper: (ChartData data, _) => data.count,
                            color: Colors.green,
                            dataLabelSettings: const DataLabelSettings(isVisible: false),
                          ),
                          LineSeries<ChartData, String>(
                            dataSource: dossierData,
                            xValueMapper: (ChartData data, _) => data.hour,
                            yValueMapper: (ChartData data, _) => data.count,
                            color: Colors.blue,
                            dashArray: <double>[5, 5],
                            dataLabelSettings: const DataLabelSettings(isVisible: false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, AppDimensions.sizeboxHeight10, 0, AppDimensions.sizeboxHeight10),//30
                margin: EdgeInsets.only(top:AppDimensions.sizeboxHeight10),
                height: MediaQuery.of(context).size.height/3,
                //  height: 500,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,color: Colors.white),
                child: SfCircularChart(
                    title:ChartTitle(
                        alignment:ChartAlignment.near,
                        text:'Répartition',
                        textStyle: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.20,
                        ),
                    ),

                    tooltipBehavior: _tooltip,
                    legend:Legend(
                      isVisible: true,
                      position: LegendPosition.right,
                      overflowMode: LegendItemOverflowMode.wrap,
                      // offset: Offset(20, 40)
                    ),
                    series: <CircularSeries<_ChartData, String>>[
                      PieSeries(
                        dataSource: List.generate(
                          titles.length, (index) {
                          return _ChartData(titles[index], dossiersForPieSerie[index], countColors[index]);
                        },
                        ).toList(),
                        pointColorMapper:(_ChartData data,  _) => data.color,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        dataLabelMapper: (_ChartData data, _) => "${data.y.toStringAsFixed(2)} %",
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                        ),
                      )
                    ]
                ),
              )
            ],
          ),
        ),
      );
  }
}

class DossierCard extends StatelessWidget {
  final String title;
  final String icon;
  final int count;
  final Color countColor;

  const DossierCard({Key? key, required this.title, required this.count, required this.icon, required this.countColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 381,
      padding: const EdgeInsets.all(24),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white /* Color */,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              Container(
                width: 50,
                height: 50,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF2F5F9),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 10,
                        top: 13,
                        child:Text(icon,style: TextStyle(fontSize: 24,),)
                    ),
                  ],
                ),
              ),
              Text(title,
                style: TextStyle(
                  color: AppColors.mainTitleColor,
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.24,
                ),
              ),
            ],
          ),
          Text(count.toString(),
            style: TextStyle(
              color:countColor,
              fontSize: 36,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.36,
            ),
          ),
        ],
      ),
    );
  }
}


class ChartData {
  final String hour;
  final int count;

  ChartData(this.hour, this.count);
}

class _ChartData {
  _ChartData(this.x, this.y,this.color);

  final String x;
  final int y;
  final Color color;
}