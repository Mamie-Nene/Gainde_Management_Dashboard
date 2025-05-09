import 'package:flutter/material.dart';

import '/src/utils/const/app_specifications/app_colors.dart';
import '/src/utils/const/routes/app_routes_name.dart';
import '/src/utils/const/app_specifications/app_dimensions.dart';

class ReportingJournalierOrbusInfinityPage extends StatefulWidget {
  const ReportingJournalierOrbusInfinityPage({Key? key}) : super(key: key);

  @override
  State<ReportingJournalierOrbusInfinityPage> createState() => _ReportingJournalierOrbusInfinityPageState();
}

class _ReportingJournalierOrbusInfinityPageState extends State<ReportingJournalierOrbusInfinityPage> {

  List<int> countData=[];
  List<String>nomEntrepriseData=[];
  List<String> listNomManu=[];
  List<String> listNomMonth=[];
  bool isLoadingForMannutentionnaire=true;
  bool _isLoading=true;


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Menu',
                      style: TextStyle(
                          fontSize: MediaQuery.textScaleFactorOf(context)*25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextButton(
                        onPressed: (){ Navigator.of(context).pushNamed(AppRoutesName.voirPlusPage);},
                        child: Text('Voir plus',
                          style: TextStyle(
                            fontSize: MediaQuery.textScaleFactorOf(context)*15,
                            color: AppColors.mainAppColor ,
                            //  color: Color(0xff1a3981),
                          ),
                        )
                    )

                  ],
                ),
              ),
              _menu(context)
            ],
          ),
      );
  }

  Widget _menu(BuildContext context){
    List<String> entries=["Total BADs Journalier", "Total Dossiers Journalier" ,  "Total Visas Journalier", "Total Sorties Journalier"];
    List<String> values=["Reporting journalier sur les traitements BAD","Reporting journalier sur les dossiers","Reporting journalier sur les visas brigade","Reporting journalier sur les sorties brigade"];
    List<IconData> icons=[Icons.table_chart,Icons.insert_chart_outlined_rounded,Icons.query_stats_outlined,Icons.bar_chart_sharp];//Icons.ssid_chart
    List<VoidCallback> actions=[
          (){Navigator.of(context).pushNamed(AppRoutesName.repartitionBadParJourPage);},
          (){Navigator.of(context).pushNamed(AppRoutesName.reportingdossierEnlevementParJourPage);},
          (){Navigator.of(context).pushNamed(AppRoutesName.reportingVisaBrigadeJournalierPage);},
          (){Navigator.of(context).pushNamed(AppRoutesName.reportingSortieBrigadeJournalierPage);},

    ];


    return
      SizedBox(
        height: MediaQuery.of(context).size.height/2,
        child: ListView.separated(
          itemCount:entries.length,
          physics:const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: actions[index],
              child: Container(
                padding: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10,AppDimensions.sizeboxHeight5 ,0,AppDimensions.sizeboxHeight5),
               // margin: EdgeInsets.only(left: AppDimensions.sizeboxWidth10, right:AppDimensions.sizeboxWidth10 ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.height/13.85,//60 ,
                          width: MediaQuery.of(context).size.width/8.7,//45,
                          padding: const EdgeInsets.all(8.0),
                          margin: EdgeInsets.only(right: AppDimensions.sizeboxWidth5),
                          decoration: BoxDecoration(
                              color:Colors.black.withOpacity(0.07),
                              shape: BoxShape.circle
                          ),
                          child: Icon(icons[index],color: AppColors.secondBlueAppColor,size: AppDimensions.sizeboxHeight25,),
                        ),
                        const SizedBox(width: 3,),
                        Column (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(entries[index],
                              style: TextStyle(
                                  fontSize: MediaQuery.textScaleFactorOf(context)*18,
                                  color: AppColors.mainAppColor,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            Text(values[index],
                              style:  TextStyle(
                                fontSize: MediaQuery.textScaleFactorOf(context)*14,
                                color: Colors.grey,
                                // fontWeight: FontWeight.bold
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),

                    Icon(Icons.arrow_right,color: AppColors.secondBlueAppColor,size: 25,),

                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: AppDimensions.sizeboxHeight10,);
          },
        ),
      );
  }


}