import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gainde_management_dashboard/src/utils/const/routes/app_routes_name.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../Src/utils/const/app_specifications/app_colors.dart';
import '../dashboard_performance_orbus.dart';

class PolePublic extends StatefulWidget {
  @override
  State<PolePublic> createState() => _PolePublicState();
}

class _PolePublicState extends State<PolePublic> {
  bool _showDetailedList = false;
  List<int> countForGraphe=[10,15,20,24,30,48,55,68,85,96];
  List<String> titlesForTab=['ASEPEX','DCSC','DEF','DI','DM','DMC','ARP'];
  List<ProcedureData> poleData=[];


  getData(List<String> data){
    for (int i = 0; i < data.length; i++) {
      poleData.add(ProcedureData(data.elementAt(i), countForGraphe.elementAt(i)));
    }
  }
  @override
  void initState() {
    getData(titlesForTab);
    _showDetailedList=true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<String> filtreNames=["Période", "Du","Au"];
    List<String> filtreValues=['Ce-mois', '06/05/2024','06/05/2024'];
    List<String> filtreIcons=['ion_caret-down-outline','Icon','Icon'];

    List<String> titles=['Dossiers dans les délais','Dépassements modérés','Dossiers traités','Dépassements importants'];
    List<String> icons=['📑','🏢','🏛️','🏦',];
    List<int> count=[27,59,10,23,37,16];
    List<Color> countColors= [AppColors.mainAppColor, Colors.orange,Colors.green,Color(0xff4C5CBE),Color(0xff5D99F4),Colors.purple,];

    List<String> subtitlesForTab=['Agence Sénégalaise de promotion des Exportations','Division de la Consommation et de le sécurité des Consommateurs','Direction des Eaux et fôret',"Direction de l'industrie",'Division de la Métrologie','Division de la Monnais et du Crédit','Agence Sénégalaise de la Réglementation Pharmaceutique ex Direction de la Pharmacie et du Médicamnt (DPM)'];
    List<int> countForTab=[34,86,24,91,37,32,28];
    List<String> dureeForTab=['02:20:04','08:25:32','12:33:37','22:08:47','30:20:04','30:20:04','30:20:04'];
    List<Color> colorsForDuration = [Colors.green,Colors.green,Colors.green,Colors.green,Colors.red,Colors.red,Colors.red,];

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle:true,
        leading: const BackButton(color: Colors.black),
        title: const Text('Pôles Publics',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 32,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.32,
          ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              height: MediaQuery.of(context).size.height/3.8,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                itemCount:titles.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return  DossierCard(
                        title: titles[index],
                        count: count[index],
                        countColor: countColors[index],
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,//nbre de ligne
                  childAspectRatio: 3 /1.2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            ),

            Container(
              height:75,
               width: double.infinity,
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),

                  color: Colors.white
              ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showDetailedList = true;
                          });
                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width/2.2,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          decoration: ShapeDecoration(
                            color: _showDetailedList? const Color(0x19009EE0):null,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                                'Liste détaillée',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:_showDetailedList? Color(0xFF2CADD8):const Color(0xFF465668) ,
                                  fontSize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showDetailedList = false;
                          });
                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width/2.2,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          decoration: ShapeDecoration(
                            color: _showDetailedList?null: const Color(0x19009EE0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child:Text(
                                'Vue graphique',
                            textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: _showDetailedList?const Color(0xFF465668):Color(0xFF2CADD8),
                                  fontSize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        ),
                      )
                    ],
                  )
            ),


            const SizedBox(height: 10),

            _showDetailedList?
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8.0),

                child: Column(
                  children: [
                    // Table Header
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Pôle',
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 20,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.20,
                              ),
                            )
                          ),
                          Expanded(
                            child: Text(
                              'Dossiers',
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 20,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.20,
                              ),
                            )
                          ),
                          Expanded(
                            child: Text(
                              'Durée',
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 20,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.20,
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/2.5,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount:titlesForTab.length ,
                        itemBuilder: (BuildContext context, int index) {
                          return   _buildConsigneeRow(
                              titlesForTab[index],
                              subtitlesForTab[index],
                              countForTab[index],
                              dureeForTab[index],
                              colorsForDuration[index]
                          );
                        },

                      ),
                    ),

                  ],
                ),
              )
            :
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
              ),
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Représentation graphique du temps de traitement des pôles',
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
                            dataSource: poleData,
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
          ],
        ),
      ),
    );
  }
  Widget _buildConsigneeRow(String title, String subtitles, int count,  String duration, Color durationColor,) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [

          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(title,
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.20,
                ),
              ),
              subtitle: Text(subtitles,
                style: TextStyle(
                  color: const Color(0xFF666666),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {Navigator.of(context).pushNamed(AppRoutesName.ascex);},
            ),
          ),
          Expanded(
            child: Text(
              count.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.18,
              ),
            ),
          ),
          Expanded(
            child: Text(
              duration,
              style: TextStyle(
                color: durationColor,
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.18,
              ),
              textAlign: TextAlign.center,

            ),
          ),
        ],
      ),
    );
  }
}

class DossierCard extends StatelessWidget {
  final String title;
  final int count;
  final Color countColor;

  const DossierCard({Key? key, required this.title, required this.count,required this.countColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Text(
                '$count%',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: countColor,
                  fontSize: 36,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.36,
                ),
              ),
              Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF7F8C8D),
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ProcedureData {
  final String name;
  final int count;

  ProcedureData(this.name, this.count);
}
