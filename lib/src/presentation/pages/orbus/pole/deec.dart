import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DEEC extends StatelessWidget {
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
        title: const Text('DEEC'),
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

            // Bar Chart
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Évolution des dossiers",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // List Section
            const Text("Procédures", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // List Items
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.grey),
                title: const Text('Procédure 1'),
                trailing: const Text('12'),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.grey),
                title: const LinearProgressIndicator(),
                trailing: const CircleAvatar(backgroundColor: Colors.grey, radius: 10),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.grey),
                title: const LinearProgressIndicator(),
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
