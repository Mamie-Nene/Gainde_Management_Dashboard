import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/src/utils/const/app_specifications/app_dimensions.dart';

class PaiementFactureOrbus extends StatefulWidget {
  const PaiementFactureOrbus({super.key});

  @override
  State<PaiementFactureOrbus> createState() => _PaiementFactureOrbusState();
}

class _PaiementFactureOrbusState extends State<PaiementFactureOrbus> {
  final searchController = TextEditingController();
  final  _scrollController = ScrollController();

  bool isFactureInit = true;
  bool isFactureTermine=false;

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

                      border: Border.all(color:  isFactureInit?  Colors.lightBlue: Colors.grey.shade400),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(7) ,bottomLeft: Radius.circular(7)),
                      gradient:
                      isFactureInit?
                      LinearGradient(
                        colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                          :
                      null,
                     // color: isFactureInit?  Colors.lightBlue :Colors.grey.shade400,
                    ),
                    child:
                    TextButton(
                        onPressed: (){
                          setState(() {
                            isFactureInit=true;
                            isFactureTermine=false;
                          //  givenList=listFactureInit;
                          });
                        },
                        child:
                        Text(
                          'Impayée',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isFactureInit?Colors.white:Colors.black,
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
                      border: Border.all(color: isFactureTermine?  Colors.lightBlue:Colors.grey.shade400),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(7) ,bottomRight: Radius.circular(7)),
                      gradient: isFactureTermine?
                      LinearGradient(
                        colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                          :
                      null,
                     // color: isFactureTermine?Colors.lightBlue: Colors.grey.shade400 ,
                    ),
                    child: TextButton(

                        onPressed: (){
                          setState(() {
                            isFactureInit=false;
                            isFactureTermine=true;
                           // givenList=listFactureOk;
                          });
                        },
                        child:
                        Text("Payée", //
                            style: TextStyle(
                              color: isFactureTermine?Colors.white:Colors.black,

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              const Text('N° FACTURE',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    height: 0,
                    // color: Color(0xFF4B5057),
                    //fontFamily:'',
                    fontSize: 16),
              ),
              SizedBox(width: AppDimensions.sizeboxWidth20,),
              const Text('ÉTAT' ,textAlign: TextAlign.start,
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
              // itemCount: filteredFactures.length,
              separatorBuilder: (BuildContext context, int index) => Divider(thickness: 0.5,color: Colors.grey,),

              // separatorBuilder: (BuildContext context, int index) => SizedBox(height: AppDimensions.sizeboxHeight5,),
              itemBuilder: (BuildContext context, int index) {

                return  Container(
                  padding:EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth5, AppDimensions.sizeboxHeight10,AppDimensions.sizeboxWidth5, AppDimensions.sizeboxHeight10),
                  width: MediaQuery.of(context).size.width,
                  child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoData(context,text:numero[index]),

                        // SizedBox(width: AppDimensions.sizeboxWidth40,),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                padding:EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight5, AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight5),
                                color: CupertinoColors.systemYellow,
                                child: Text('Impayée',style: TextStyle(color: Colors.white),),
                              ),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),


                        //Image.asset('asset/images/three-dots.png',scale: 8,)
                      ],
                    )
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
