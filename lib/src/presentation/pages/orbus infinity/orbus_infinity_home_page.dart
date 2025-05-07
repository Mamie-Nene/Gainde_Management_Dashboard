import 'package:flutter/material.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus%20infinity/reporting_journalier/reporting_page.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus%20infinity/statistique_journaliere/stats_orbus_infinity_page.dart';

import '/src/utils/const/app_specifications/app_colors.dart';
import '/src/utils/const/routes/app_routes_name.dart';
import '/src/utils/const/app_specifications/app_dimensions.dart';

class OrbusInfinityHomePage extends StatefulWidget {
  const OrbusInfinityHomePage({Key? key}) : super(key: key);

  @override
  State<OrbusInfinityHomePage> createState() => _OrbusInfinityHomePageState();
}

class _OrbusInfinityHomePageState extends State<OrbusInfinityHomePage> {
  bool isForStatistique=false;
  bool isForReporting=false;

  @override
  void initState() {
    isForStatistique=true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:   BackButton(color:Colors.black, onPressed: (){Navigator.pop(context);}),
        title: const Text('Orbus Infinity', style: TextStyle(color: Colors.black)),
        //backgroundColor: Colors.white,
       backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: AppColors.secondBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
              children: [
                // Search Bar
                Container(
                  height:75,
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width: MediaQuery.of(context).size.width/2.4,
                          height: MediaQuery.of(context).size.height/20,
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient:
                              isForStatistique?
                                LinearGradient(
                                  colors: [Colors.purple.withOpacity(0.8), Colors.purple.withOpacity(0.5)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                                :
                               null,
                          ),
                          child: TextButton(
                              onPressed: (){
                                setState(() {
                                  isForStatistique=true;
                                  isForReporting=false;
                                });
                              },
                              child:
                              Text("Statistiques", //
                                  style: TextStyle(
                                    color: isForStatistique?Colors.white:Colors.black,

                                    fontSize:  MediaQuery.textScaleFactorOf(context)*17,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    height: 0,

                                    fontStyle:  FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center
                              )
                          ),

                        ),

                        Container(
                          width: MediaQuery.of(context).size.width/2.4,
                          height: MediaQuery.of(context).size.height/20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient:
                            isForReporting?
                            LinearGradient(
                              colors: [Colors.purple.withOpacity(0.8), Colors.purple.withOpacity(0.5)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                                :
                            null,
                          ),
                          child:
                          TextButton(
                              onPressed: (){
                                setState(() {
                                  isForStatistique=false;
                                  isForReporting=true;
                                });
                              },
                              child:
                              Text(
                                'Reporting',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:isForReporting?Colors.white:Colors.black,
                                  fontSize: MediaQuery.textScaleFactorOf(context)*17,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                isForStatistique?
                StatistiquesOrbusInfinityPage()
                :
                ReportingJournalierOrbusInfinityPage()

              ],
            ),
      ),
    );
  }



}