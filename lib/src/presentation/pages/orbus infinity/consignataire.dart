import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gainde_management_dashboard/src/utils/const/routes/app_routes_name.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../Src/utils/const/app_specifications/app_colors.dart';

class Consignataire extends StatelessWidget {
  final List<ProcedureData> chartData = [
    ProcedureData('Procédure A', 200),
    ProcedureData('Procédure B', 140),
    ProcedureData('Procédure C', 60),
    ProcedureData('Procédure D', 200),
    ProcedureData('Procédure N', 120),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> filtreNames=["Période", "Du","Au"];
    List<String> filtreValues=['Ce-mois', DateTime.now().month.toString(),DateTime.now().month.toString(),];
    List<String> filtreIcons=['ion_caret-down-outline','Icon','Icon'];

    List<String> titles=['Dossiers dans les délais','Dépassements modérés','Dossiers traités','Dépassements importants'];
    List<String> icons=['📑','🏢','🏛️','🏦',];
    List<int> count=[27,59,10,23,37,16];
    List<Color> countColors= [AppColors.mainAppColor, Colors.orange,Colors.green,Color(0xff4C5CBE),Color(0xff5D99F4),Colors.purple,];

    List<String> titlesForTab=['Diamong Shipping','Happag','DEF','DI','DM','DMC','ARP'];
    List<String> subtitlesForTab=['Agence Sénégalaise de promotion des Exportations','Division de la Consommation et de le sécurité des Consommateurs','Direction des Eaux et fôret',"Direction de l'industrie",'Division de la Métrologie','Division de la Monnais et du Crédit','Agence Sénégalaise de la Réglementation Pharmaceutique ex Direction de la Pharmacie et du Médicamnt (DPM)'];
    List<int> countForTab=[34,86,24,91,37,32,28];
    List<String> dureeForTab=['02:20:04','08:25:32','12:33:37','22:08:47','30:20:04','30:20:04','30:20:04'];

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle:true,
        leading: const BackButton(color: Colors.black),
        title: const Text('Pôles Publics',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/10,
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
                  return  DossierCard(
                        title: titles[index],
                        count: count[index],
                        countColor: countColors[index],
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,//nbre de ligne
                  childAspectRatio: 4 / 1.8,
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
                      Container(
                        width:MediaQuery.of(context).size.width/2.2,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        decoration: ShapeDecoration(
                          color: const Color(0x19009EE0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text(
                              'Liste détaillé',
                              style: TextStyle(
                                color: const Color(0xFF2CADD8) /* bleu-clair */,
                                fontSize: 20,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width:MediaQuery.of(context).size.width/2.2,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text(
                              'Vue graphique',
                              style: TextStyle(
                                color: const Color(0xFF465668),
                                fontSize: 20,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
            ),

            GestureDetector(
              onTap: (){Navigator.of(context).pushNamed(AppRoutesName.deec);},
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: const Text('Pôle'),
                  trailing: const Text('Durée'),
                 // trailing: const  CircleAvatar(backgroundColor: Colors.grey, radius: 10),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) =>
                    ListTile(
                  title: Text(titlesForTab[index]),
                  subtitle: Text(subtitlesForTab[index]),
                  trailing: Text(dureeForTab[index],style: TextStyle(color: Colors.green),),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutesName.deec);
                  },
                ),
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
  final int count;
  final Color countColor;

  const DossierCard({Key? key, required this.title, required this.count,required this.countColor})
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
