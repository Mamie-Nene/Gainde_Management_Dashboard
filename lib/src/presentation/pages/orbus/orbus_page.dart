
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus/a_propos_orbus.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus/perfomance_orbus_page.dart';
import '/src/presentation/pages/orbus/dashboard_performance_orbus.dart';
import '/src/utils/const/routes/app_routes_name.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class OrbusPage extends StatefulWidget {
  const OrbusPage({super.key});

  @override
  State<OrbusPage> createState() => _OrbusPageState();
}
class _OrbusPageState extends State<OrbusPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  void _accueilPopUp(BuildContext context){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context)
        {
          return CupertinoAlertDialog(

            title: const Text("Retour à la page d'accueil"),

            content: const Text("Voulez vous retourner à la page d'accueil?"),

            actions: [

              CupertinoDialogAction(
                onPressed: () { Navigator.of(context).popUntil((route) => route.isFirst);},
                isDefaultAction: false,
                isDestructiveAction: false,
                child: const Text('Oui',style: TextStyle(fontWeight:FontWeight.w500)),
              ),

              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRoutesName.gieParts);
                },
                isDefaultAction: true,
                isDestructiveAction: true,

                child: const Text('Non'),
              )
            ],
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      DashboardOrbusPage(),
      PerformanceOrbusPage(),
      AProposOrbus(),
    ];

    void onItemTapped(int index, BuildContext context) {
      if (index == pageList.length) {
        _accueilPopUp(context);
      } else {

        setState(() {
          _currentIndex = index;
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle:true,
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
      body:pageList.elementAt(_currentIndex),
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
