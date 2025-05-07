import 'package:flutter/material.dart';
import 'package:gainde_management_dashboard/src/utils/const/routes/app_routes_name.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../performance_orbus_page.dart';

class PolePublic extends StatelessWidget {
  final List<ProcedureData> chartData = [
    ProcedureData('Procédure A', 200),
    ProcedureData('Procédure B', 140),
    ProcedureData('Procédure C', 60),
    ProcedureData('Procédure D', 200),
    ProcedureData('Procédure N', 120),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pôles Publics'),
        leading: BackButton(onPressed: (){Navigator.of(context).pop();},),
        actions: const [Icon(Icons.search)],
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Picker
            TextFormField(
              initialValue: '06/05/2024',
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Évolution des dossiers",
                      style: TextStyle(fontWeight: FontWeight.bold)),
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
                          dataSource: [
                            ChartData('Dossier A', 0),
                            ChartData('Dossier B', 120),
                            ChartData('Dossier C', 40),
                            ChartData('Dossier D', 250),
                            ChartData('Dossier N', 200),
                          ],
                          xValueMapper: (ChartData data, _) => data.hour,
                          yValueMapper: (ChartData data, _) => data.count,
                          color: Colors.black,
                          dashArray: <double>[5, 5],
                          dataLabelSettings: const DataLabelSettings(isVisible: false),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              height:75,
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),

                  color: Colors.white
              ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                      width: MediaQuery.of(context).size.width/2.4,
                      height: MediaQuery.of(context).size.height/20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.grey.shade300,
                      ),
                      child:Text("Liste", //
                        style: TextStyle(
                          color:Colors.black,

                          fontSize:  MediaQuery.textScaleFactorOf(context)*17,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0,

                          fontStyle:  FontStyle.normal,
                        ),
                        textAlign: TextAlign.center)
                      ),
                      Container(
                      width: MediaQuery.of(context).size.width/2.4,
                      height: MediaQuery.of(context).size.height/20,

                      child:Text("Graphique", //
                        style: TextStyle(
                          color:Colors.grey,

                          fontSize:  MediaQuery.textScaleFactorOf(context)*17,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0,

                          fontStyle:  FontStyle.normal,
                        ),
                        textAlign: TextAlign.center)
                      )
                    ],
                  )
            ),
            // List Items
            GestureDetector(
              onTap: (){Navigator.of(context).pushNamed(AppRoutesName.deec);},
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.grey),
                  title: const Text('DEEC'),
                  trailing: const  CircleAvatar(backgroundColor: Colors.grey, radius: 10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.grey),
                title: const Divider(thickness: 3,),
                trailing: const CircleAvatar(backgroundColor: Colors.grey, radius: 10),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.grey),
                title: const Divider(thickness: 3,),
                trailing: const CircleAvatar(backgroundColor: Colors.grey, radius: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProcedureData {
  final String name;
  final int count;

  ProcedureData(this.name, this.count);
}
