
import 'package:flutter/material.dart';
import 'package:gainde_management_dashboard/src/utils/const/routes/app_routes_name.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PerformanceOrbusScreen extends StatefulWidget {
  const PerformanceOrbusScreen({super.key});

  @override
  State<PerformanceOrbusScreen> createState() => _PerformanceOrbusScreenState();
}
class _PerformanceOrbusScreenState extends State<PerformanceOrbusScreen> {
  DateTime selectedDate = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    final dateString = DateFormat('dd/MM/yyyy').format(selectedDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Performance ORBUS',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Date Picker
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(dateString,
                          style: const TextStyle(fontSize: 16)),
                    ),
                    const Icon(Icons.calendar_today, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Grid of dossier cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children:  [
                  DossierCard(title: "BRV/DPI", count: 130),
                  GestureDetector(
                      onTap:(){Navigator.of(context).pushNamed(AppRoutesName.polePublicOrbus);},
                      child: DossierCard(title: "Pôles publics", count: 140)
                  ),
                  DossierCard(title: "Assureurs", count: 60),
                  DossierCard(title: "Banques", count: 70),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Tableau de bord',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline),
            label: 'Performance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'À propos',
          ),
        ],
      ),
    );
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
        color: Colors.grey[300],
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
class ChartData {
  final String hour;
  final int count;

  ChartData(this.hour, this.count);
}
