import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/src/utils/const/app_specifications/app_dimensions.dart';

class MesDossiersOrbus extends StatefulWidget {
  const MesDossiersOrbus({super.key});

  @override
  State<MesDossiersOrbus> createState() => _MesDossiersOrbusState();
}

class _MesDossiersOrbusState extends State<MesDossiersOrbus> {
  final searchController = TextEditingController();
  final  _scrollController = ScrollController();

  bool isDossierInit = true;
  bool isDossierEnCours=false;
  bool isDossierTermine=false;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  void _onSearchTextChanged(String text) {
  /*  print('text on search $text');
    setState(() {
      givenList= text.isEmpty
          ? dossiers
          : dossiers
          .where((item) => item.NUMERODOSSIERTPS.toString().toLowerCase().contains(text.toLowerCase())|| item.DATEDOSSIERTPS.toLowerCase().contains(text.toLowerCase())|| item.NIVEAUEXECUTIONDOSSIERTPS.toLowerCase().contains(text.toLowerCase()))
          .toList();
      //item.adresse.toString().toLowerCase().contains(text.toLowerCase())
    });*/
  }


  @override
  Widget build(BuildContext context) {
    List<String> numero=["N° 123256","N° 123157","N° 132438"];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            margin:EdgeInsets.only(top: 20,bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(

                    width: MediaQuery.of(context).size.width/3.5,

                    height: MediaQuery.of(context).size.height/20,
                    decoration: BoxDecoration(

                      border: Border.all(color:  isDossierInit?  Colors.lightBlue: Colors.grey.shade400),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(7) ,bottomLeft: Radius.circular(7)),
                      gradient:
                      isDossierInit?
                      LinearGradient(
                        colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                          :
                      null,
                     // color: isDossierInit?  Colors.lightBlue :Colors.grey.shade400,
                    ),
                    child:
                    TextButton(
                        onPressed: (){
                          setState(() {
                            isDossierInit=true;
                            isDossierEnCours=false;
                            isDossierTermine=false;
                          //  givenList=listDossierInit;
                          });
                        },
                        child:
                        Text(
                          'Initialisé',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isDossierInit?Colors.white:Colors.black,
                            fontSize: MediaQuery.textScaleFactorOf(context)*16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3.5,
                    height: MediaQuery.of(context).size.height/20,
                    decoration: BoxDecoration(
                      border: Border.all(color: isDossierEnCours?Colors.lightBlue: Colors.grey.shade400,),
                      gradient:
                      isDossierEnCours?
                      LinearGradient(
                        colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                          :
                      null,
                    //  color: isDossierEnCours?Colors.lightBlue: Colors.grey.shade400,
                    ),
                    child: TextButton(

                        onPressed: (){
                          setState(() {
                            isDossierEnCours=true;
                            isDossierInit=false;
                            isDossierTermine=false;
                         //   givenList=listDossierEnCours;
                          });
                        },
                        child:
                        Text("En cours", //
                            style: TextStyle(
                              color: isDossierEnCours?Colors.white:Colors.black,

                              fontSize:  MediaQuery.textScaleFactorOf(context)*16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,

                              fontStyle:  FontStyle.normal,
                            ),
                            textAlign: TextAlign.center
                        )
                    ),

                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3.5,
                    height: MediaQuery.of(context).size.height/20,
                    decoration: BoxDecoration(
                      border: Border.all(color: isDossierTermine?  Colors.lightBlue:Colors.grey.shade400),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(7) ,bottomRight: Radius.circular(7)),
                      gradient: isDossierTermine?
                      LinearGradient(
                        colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                          :
                      null,
                     // color: isDossierTermine?Colors.lightBlue: Colors.grey.shade400 ,
                    ),
                    child: TextButton(

                        onPressed: (){
                          setState(() {
                            isDossierInit=false;
                            isDossierEnCours=false;
                            isDossierTermine=true;
                           // givenList=listDossierOk;
                          });
                        },
                        child:
                        Text("Terminé", //
                            style: TextStyle(
                              color: isDossierTermine?Colors.white:Colors.black,

                              fontSize:  MediaQuery.textScaleFactorOf(context)*16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,

                              fontStyle:  FontStyle.normal,
                            ),
                            textAlign: TextAlign.center
                        )
                    ),

                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight10, AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight30),
            child: Container(
              margin: const EdgeInsets.only(bottom: 30,top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                //color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child:TextField(
                showCursor: true,
                cursorColor: Colors.grey.shade800,
                cursorWidth: 1,
                controller: searchController,
                decoration:  InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Rechercher un élement',
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                onChanged: _onSearchTextChanged,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:const [
              Text('DOSSIER',
                //textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    height: 0,
                    // color: Color(0xFF4B5057),
                    //fontFamily:'',
                    fontSize: 16),
              ),
              // SizedBox(width: AppDimensions.sizeboxWidth20,),
              Text('DATE',
                // textAlign: TextAlign.,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    height: 0,
                    // color: Color(0xFF4B5057),
                    //fontFamily:'',
                    fontSize: 16),
              ),
              // SizedBox(width: AppDimensions.sizeboxWidth20,),
              Text('ÉTAT' ,
                //textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    height: 0,
                    // color: Color(0xFF4B5057),
                    //fontFamily:'',
                    fontSize: 16),
              ),
            ],
          ),

          const Divider(thickness: 0.5,color: Colors.grey,),
          ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount:numero.length,
              // itemCount: filteredDossiers.length,
              separatorBuilder: (BuildContext context, int index) => Divider(thickness: 0.5,color: Colors.grey,),

              // separatorBuilder: (BuildContext context, int index) => SizedBox(height: AppDimensions.sizeboxHeight5,),
              itemBuilder: (BuildContext context, int index) {

                return  Container(//10
                  padding:EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth5, AppDimensions.sizeboxHeight10,AppDimensions.sizeboxWidth5, AppDimensions.sizeboxHeight10),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoData(context,text: numero[index] ),
                      _infoData(context, text: "05/05/2025"),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight5, AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight5),
                            color:Colors.lightBlue ,
                            child: Text('Initialisé',style: TextStyle(color: Colors.white),),
                          ),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ],
                  ),

                );
              }),


        ],
      ),
    );
  }
  Widget _infoData(BuildContext context,{
    required String text,
  }){
    return
      Text(text,
        textAlign: TextAlign.center,
        style:  TextStyle(
            fontWeight: FontWeight.w500,
            height: 0,
            color: Color(0xFF4B5057),
            fontFamily:'Roboto',
            fontSize: MediaQuery.textScaleFactorOf(context)*16),
      );
  }
}
