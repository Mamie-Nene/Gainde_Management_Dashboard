import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ASEPEX extends StatelessWidget {

  final List<ProcedureData> chartData = [
    ProcedureData('Jan', 230),
    ProcedureData('Fev', 240),
    ProcedureData('Mars', 280),
    ProcedureData('Avr', 300),
    ProcedureData('Mai', 320),
    ProcedureData('Juin', 350),
    ProcedureData('Jul', 380),
    ProcedureData('Aout', 380),
    ProcedureData('Sep', 380),
    ProcedureData('Oct', 350),
    ProcedureData('Nov', 320),
    ProcedureData('Dec', 300),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> filtreNames=["Période", "Du","Au"];
    List<String> filtreValues=['Ce-mois', '06/05/2024','06/05/2024'];
    List<String> filtreIcons=['ion_caret-down-outline','Icon','Icon'];

    List<String> procedureName=['A','B','C','D','E'];
    List<int> procedureValues=[400,293,147,398,220];


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ASEPEX',
          style: TextStyle(
            color: const Color(0xFF333333),
            fontSize: 32,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.32,
          ),
        ),
        leading: BackButton(),
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
           /* TextFormField(
              initialValue: '06/05/2024',
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              readOnly: true,
            ),*/
            SizedBox(
              height: MediaQuery.of(context).size.height/12,
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
            // Bar Chart
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white
              ),
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Évolution des dossiers",
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
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        ColumnSeries<ProcedureData, String>(
                          dataSource: chartData,
                          xValueMapper: (ProcedureData data, _) => data.name,
                          yValueMapper: (ProcedureData data, _) => data.count,
                            color: const Color(0xFFC3D1F6)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // List Section
            const Text("Procédures",
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 32,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.32,
              ),
            ),
            const SizedBox(height: 10),

           SizedBox(
             height: MediaQuery.of(context).size.height/2.5,
             width: MediaQuery.of(context).size.width,
             child: ListView.builder(
               itemCount:procedureName.length ,
               itemBuilder: (BuildContext context, int index) {
                 return   Container(
                   width: double.infinity,
                   padding: const EdgeInsets.all(20),
                   decoration: ShapeDecoration(
                     color: Colors.white ,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(16),
                     ),
                   ),
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     spacing: 15,
                     children: [
                       Container(
                         width: 56,
                         height: 56,
                         child: Stack(
                           children: [
                             Positioned(
                               left: 0,
                               top: 0,
                               child: Container(
                                 width: 56,
                                 height: 56,
                                 decoration: ShapeDecoration(
                                   color: const Color(0x19009EE0),
                                   shape: OvalBorder(),
                                 ),
                               ),
                             ),
                             Positioned(
                               left: 12,
                               top: 12.50,
                               child: Container(
                                 width: 32,
                                 height: 32,
                                 decoration: BoxDecoration(),
                                 child: Stack(),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Expanded(
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           spacing: 5,
                           children: [
                             Text(
                               'Procédure ${procedureName[index]}',
                               style: TextStyle(
                                 color: const Color(0xFF333333),
                                 fontSize: 24,
                                 fontFamily: 'Lato',
                                 fontWeight: FontWeight.w600,
                                 letterSpacing: 0.24,
                               ),
                             ),
                             Text(
                               'Publié 10 mars 2022  • 203Mo',
                               style: TextStyle(
                                 color: const Color(0xFF666666),
                                 fontSize: 14,
                                 fontFamily: 'Inter',
                                 fontWeight: FontWeight.w400,
                               ),
                             ),
                           ],
                         ),
                       ),
                       Text(procedureValues[index].toString(),
                         style: TextStyle(
                           color: const Color(0xFF666666),
                           fontSize: 24,
                           fontFamily: 'Lato',
                           fontWeight: FontWeight.w600,
                           letterSpacing: 0.24,
                         ),
                       ),
                     ],
                   ),
                 );
               },

             ),
           )
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
