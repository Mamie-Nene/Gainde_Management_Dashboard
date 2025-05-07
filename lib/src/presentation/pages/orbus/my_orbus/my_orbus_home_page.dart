import 'package:flutter/material.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus%20infinity/reporting_journalier/reporting_page.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus%20infinity/statistique_journaliere/stats_orbus_infinity_page.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus/my_orbus/mes_dossiers_orbus.dart';
import 'package:gainde_management_dashboard/src/presentation/pages/orbus/my_orbus/paiement_facture_orbus.dart';

import '/src/utils/const/app_specifications/app_colors.dart';
import '/src/utils/const/routes/app_routes_name.dart';
import '/src/utils/const/app_specifications/app_dimensions.dart';

class MyOrbusHomePage extends StatefulWidget {
  const MyOrbusHomePage({Key? key}) : super(key: key);

  @override
  State<MyOrbusHomePage> createState() => _MyOrbusHomePageState();
}

class _MyOrbusHomePageState extends State<MyOrbusHomePage> {
  bool isForDossiers=false;
  bool isForPaiement=false;

  @override
  void initState() {
    isForDossiers=true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:   BackButton(color:Colors.black, onPressed: (){Navigator.pop(context);}),
        title: const Text('MyOrbus', style: TextStyle(color: Colors.black)),
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
                              isForDossiers?
                                LinearGradient(
                                  colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.5)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                                :
                               null,
                          ),
                          child: TextButton(
                              onPressed: (){
                                setState(() {
                                  isForDossiers=true;
                                  isForPaiement=false;
                                });
                              },
                              child:
                              Text("Mes Dossiers", //
                                  style: TextStyle(
                                    color: isForDossiers?Colors.white:Colors.black,

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
                            isForPaiement?
                            LinearGradient(
                              colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.5)],
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
                                  isForDossiers=false;
                                  isForPaiement=true;
                                });
                              },
                              child:
                              Text(
                                'Paiement Facture',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:isForPaiement?Colors.white:Colors.black,
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
                isForDossiers?
                MesDossiersOrbus()
                :
                PaiementFactureOrbus()

              ],
            ),
      ),
    );
  }

  listViewWidget(BuildContext context){
    List<String> titles = ['Mes dossiers','Paiement Facture/Dossier','Dossiers Favoris'];
    List<String> subtitles = ['Consultez, recherchez et payez vos dossiers','Payer une facture, un dossier',"Mes dossiers favoris enregistrés"];
    List<IconData> icons = [Icons.file_copy,Icons.payment,Icons.star_border_purple500];
    List<VoidCallback> actions = [(){Navigator.of(context).pushNamed(AppRoutesName.mesDossiersPage);},(){Navigator.of(context).pushNamed(AppRoutesName.whatToPay);},(){Navigator.of(context).pushNamed(AppRoutesName.favoriPage);}];

    return ListView.separated(
        separatorBuilder: ( BuildContext context, int index) {
          return SizedBox(height: AppDimensions.sizeboxHeight10,);
        } ,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: titles.length,
        itemBuilder:( BuildContext context, int index) {
          return  _miniContainerRow(context,title: titles[index], icon: icons[index], action: actions[index],subtitle: subtitles[index],);
        }
    );
  }

  Container _miniContainerRow(BuildContext context,{
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback action,
  }){
    return Container(
      padding: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight30, AppDimensions.sizeboxWidth20, AppDimensions.sizeboxHeight30),
      decoration:  BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [BoxShadow(
              color: Colors.blueGrey,
              // color: Color(0x33b8b8d2),
              offset: Offset(1,5),
              blurRadius: 12,
              spreadRadius: -4
          ) ],
          border: Border.all(color: Colors.black45)
      ),

      child: InkWell(
        onTap: action,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [

                Text(title,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      //color: AppColors.homePageTitleOfElementOnCategoryContainerColor,
                      fontSize: MediaQuery.textScaleFactorOf(context)*19, //18
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,

                    )
                ),
                SizedBox(height: AppDimensions.sizeboxHeight18,),

                Text(subtitle,
                    style:  TextStyle(
                      fontFamily: 'Roboto',
                      //color: AppColors.homePageTitleOfElementOnCategoryContainerColor,
                      fontSize:MediaQuery.textScaleFactorOf(context)* 13,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,
                    )
                ),
              ],
            ),
            Icon(icon,color:Colors.lightBlue,size: 40,),
          ],
        ),
      ),
    );
  }

}