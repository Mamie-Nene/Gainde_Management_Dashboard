

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import '/src/utils/const/routes/app_routes_name.dart';


class PerformanceOrbusPage extends StatefulWidget {
  const PerformanceOrbusPage({super.key});

  @override
  State<PerformanceOrbusPage> createState() => _PerformanceOrbusPageState();
}
class _PerformanceOrbusPageState extends State<PerformanceOrbusPage> {

  @override
  Widget build(BuildContext context) {

    return Container(); /* Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Container(
                  width: 249,
                  padding: const EdgeInsets.all(15),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 3,
                        children: [
                          Text(
                            'Période',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 16,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Ce-mois',
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
                      Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Icon(Icons.arrow_drop_down_outlined),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 249,
                  padding: const EdgeInsets.all(15),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 3,
                        children: [
                          Text(
                            'Période',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 16,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Ce-mois',
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
                      Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Icon(Icons.arrow_drop_down_outlined),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Grid of dossier cards
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 4 / 1.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children:  [
                  DossierCard2(title: "DRAV",icon: '📑', count: 130),
                  DossierCard2(title: "Assurances",icon: '🏢', count: 60),
                  GestureDetector(
                      onTap:(){Navigator.of(context).pushNamed(AppRoutesName.polePublicOrbus);},
                      child: DossierCard2(title: "Pôles publics", icon:'🏛️',count: 140)
                  ),
                  DossierCard2(title: "Banques", icon:'🏦',count: 70),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Replace this section inside your `body` Column:

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 200,
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
                            ChartData('1h', 0),
                            ChartData('2h', 120),
                            ChartData('3h', 40),
                            ChartData('4h', 250),
                            ChartData('5h', 200),
                            ChartData('6h', 270),
                            ChartData('7h', 150),
                            ChartData('8h', 320),
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

            const SizedBox(height: 12),
          ],
        ),
      );*/
  }
}

class DossierCard extends StatelessWidget {
  final String title;
  final int count;

  const DossierCard({Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white54,
            child: Icon(Icons.folder_open, size: 28, color: Colors.black45),
          ),
          const SizedBox(height: 12),
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text("$count dossiers", style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
class DossierCard2 extends StatelessWidget {
  final String title;
  final String icon;
  final int count;

  const DossierCard2({Key? key, required this.title, required this.count, required this.icon})
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
                      left: 13,
                      top: 13,
                      child: Text(icon,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(title,
                style: TextStyle(
                  color: const Color(0xFF2C3E50),
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.24,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                '27',
                style: TextStyle(
                  color: const Color(0xFF2C5F9E),
                  fontSize: 36,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.36,
                ),
              ),
            ],
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
