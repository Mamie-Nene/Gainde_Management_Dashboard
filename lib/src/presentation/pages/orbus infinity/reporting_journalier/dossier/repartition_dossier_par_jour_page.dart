import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/src/domain/local/donneebydateForDossierEnlevement.dart';
import '/src/data/remote/get_dossier_enlevement_data.dart';
import '/src/domain/remote/dossier_enlevement/DossierEnlevement.dart';

import '/src/utils/api/api_url.dart';
import '/src/utils/const/app_specifications/app_colors.dart';
import '/src/utils/const/app_specifications/app_dimensions.dart';
import '/src/utils/variable/global_variable.dart';

import '/src/presentation/widgets/AppTitleSecond.dart';
import '/src/presentation/widgets/custom_textfield.dart';
import 'reporting_dossier_enlevement_chart.dart';


class RepartitionDossierParJour extends StatefulWidget {
  const RepartitionDossierParJour({Key? key}) : super(key: key);

  @override
  State<RepartitionDossierParJour> createState() => _RepartitionDossierParJourState();
}

class _RepartitionDossierParJourState extends State<RepartitionDossierParJour> {
  final _date1Key = GlobalKey<FormState>();
  final _date2Key = GlobalKey<FormState>();
  bool  _isRunning=false;
  bool isDossierTrier=false;

  bool isForGraphique=false;
  bool isForVolumetrie=false;

  String? date1;
  String? dateGetted1;
  String? dateGetted2;
  String? date2;


  DateTime firstDate = DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
  TextEditingController dateInputController1 = TextEditingController();
  TextEditingController dateInputController2 = TextEditingController(text: DateFormat('dd-MM-yyyy').format( DateTime.now()));



  List<DonneeByDateFromVolumetrieDossierEnlevement> _uniqueData = []; //  late
  List<DonneeByDateFromVolumetrieDossierEnlevement> originalListDossier=[];
  List<DonneeByDateFromVolumetrieDossierEnlevement> dossierTrier=[];


  Future<List<DossierEnlevement>> getVolumetrieDossierEnlevement() async{
    var data =  await GetTotalDataApi().getDossierEntreDate(ApiUrl().getDossierEnlevementEntreDate,date1!,date2!);
    if (data!=null){
      _uniqueData = processDataByDate(data);
      _uniqueData.sort((a, b) => b.dateCreation.compareTo(a.dateCreation));
    }
    return data;
  }

  List<DonneeByDateFromVolumetrieDossierEnlevement> processDataByDate(List<DossierEnlevement> data) {
    Map<String, DonneeByDateFromVolumetrieDossierEnlevement> dateMap = {};
    for (var item in data) {
      if (dateMap.containsKey(item.dateCreation)) {
        // If date already exists, increment the count
        dateMap[item.dateCreation]!.count += 1;
      } else {
        // If codeActeur does not exist, add it with the initial count of 1
        dateMap[item.dateCreation] = DonneeByDateFromVolumetrieDossierEnlevement(
          item.dateCreation,
          1,
        );
      }
    }

    // Convert the map to a list of DonneeFromVolumetrieBAD
    List<DonneeByDateFromVolumetrieDossierEnlevement> uniqueData = dateMap.values.toList();

    return uniqueData;
  }


  @override
  void initState() {
    isForVolumetrie=true;
    dateInputController1 = TextEditingController(text: DateFormat('dd-MM-yyyy').format(firstDate));
    date1 = DateFormat('yyyy-MM-dd').format(firstDate);
    date2= DateFormat('yyyy-MM-dd').format(DateTime.now());
    dateGetted1=date1;
    dateGetted2=date2;

    getVolumetrieDossierEnlevement();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
              const AppTitleSecond(title: 'Reporting Journalier Dossiers',),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      height: MediaQuery.of(context).size.height/20,
                      decoration: BoxDecoration(

                        border: Border.all(color:  isForVolumetrie?  AppColors.mainAppColor: Colors.grey.shade400),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10) ,bottomLeft: Radius.circular(10)),

                        color: isForVolumetrie?  AppColors.mainAppColor : Colors.black.withOpacity(0.07),
                        //  color: isForVisa?  AppColors.mainAppColor :Colors.grey.shade400,
                      ),
                      child:
                      TextButton(
                          onPressed: (){
                            setState(() {
                              isForVolumetrie=true;
                              isForGraphique=false;
                             // _uniqueData.sort((a, b) => b.dateCreation.compareTo(a.dateCreation));
                            });
                          },
                          child:
                          Text(
                            'Volumétrie',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:isForVolumetrie?Colors.white:Colors.black,
                              fontSize: MediaQuery.textScaleFactorOf(context)*16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          )
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      height: MediaQuery.of(context).size.height/20,
                      decoration: BoxDecoration(
                        border: Border.all(color: isForGraphique?  AppColors.mainAppColor:Colors.grey.shade400),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10) ,bottomRight: Radius.circular(10)),

                        color: isForGraphique?AppColors.mainAppColor: Colors.black.withOpacity(0.07) ,
                        //  color: isForSortie?AppColors.mainAppColor: Colors.grey.shade400 ,
                      ),
                      child: TextButton(

                          onPressed: (){
                            setState(() {
                              isForVolumetrie=false;
                              isForGraphique=true;

                            });
                          },
                          child: Text("Graphique", //
                              style: TextStyle(
                                color: isForGraphique?Colors.white:Colors.black,

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
              Container(
                padding:  EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight10,0,AppDimensions.sizeboxHeight10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/10.4,

                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                          key: _date1Key,
                          child: CustomTextfieldForDate(
                              dateController: dateInputController1,
                              labelText: "Date de début",
                              // action:  () =>_dateFunction(dateController: dateInputController1,date: date1)
                              action:  () async {
                                String date = await _dateFunction(dateInputController1,date1!);
                                print("date here $date");
                                setState(() {
                                  dateGetted1 = date;
                                });
                              }
                             // action:  () =>_dateFunction1(dateInputController1,date1!)
                          )
                      ),
                      Form(
                          key: _date2Key,
                          child: CustomTextfieldForDate(
                              dateController:  dateInputController2,
                              labelText: "Date de fin",
                              //  action:  () =>_dateFunction(dateController: dateInputController2,date: date2)
                              action:  () async {
                                String date = await _dateFunction(dateInputController2,date2!);
                                setState(() {
                                  dateGetted2 = date;
                                });
                              }

                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppDimensions.sizeboxHeight12),
                        child:
                          IconButton(//Elevated Button
                              style:IconButton.styleFrom(
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10) ,bottomLeft: Radius.circular(10),topRight: Radius.circular(10) ,bottomRight: Radius.circular(10)),),
                                  backgroundColor: _isRunning?Colors.grey.shade300:AppColors.mainAppColor
                              ),
                            onPressed: _isRunning?null:()async{
                              setState(() {
                                _isRunning = true;
                                date1=dateGetted1;
                                date2=dateGetted2;
                              });
                              if (_date1Key.currentState!.validate()|| _date2Key.currentState!.validate()) {

                                debugPrint('date1: $date1 date2:$date2');
                                globalResponseMessage.loadingMessage("Résultat en cours");
                               await  getVolumetrieDossierEnlevement();

                              }
                              setState(() {
                                _isRunning = false;
                              });
                            },
                              icon: Icon(Icons.search,color: _isRunning?Colors.grey.shade600:Colors.white,),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
             _forPeriodicResearch()
             // _voirDetail?_forPeriodicResearchWithoutCount(): _forPeriodicResearch(),
            ],
        ),
      ),
    );
  }


  _dateFunction(TextEditingController dateInputController, String date) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate:DateTime.now(), //- not to allow to choose after today.
      locale: const Locale("fr", "FR"),

    );
    if (pickedDate != null) {

      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      print(date);
        dateInputController.text = formattedDate; ///set output date to TextField value.;

        date = DateFormat('yyyy-MM-dd').format(pickedDate);
        print(date);
    }
    print(date);
    return date;
  }

  Widget _forPeriodicResearch(){
    return FutureBuilder<List<DossierEnlevement>>(
      future:  getVolumetrieDossierEnlevement(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          originalListDossier =  processDataByDate(snapshot.data!);
         // originalListDossier = List.from(snapshot.data!);
          print(originalListDossier.length);
          if(originalListDossier.isEmpty){ return const Text('La liste est vide');}
          if(isDossierTrier){
            print("trions");
            _uniqueData.sort((a, b) => b.count.compareTo(a.count));
          } else {
            _uniqueData = List.from(originalListDossier);
            _uniqueData.sort((a, b) => b.dateCreation.compareTo(a.dateCreation));
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text( "${snapshot.data?.length} Dossier(s)",style: TextStyle(fontSize: MediaQuery.textScaleFactorOf(context)*17),),
                isForVolumetrie?
                Column(
                  children: [
                    _detailCheck(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:  EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight10, AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight20),
                      decoration: const BoxDecoration(
                        color:Colors.white,
                        boxShadow: [BoxShadow(
                            color: Colors.blueGrey,
                            // color: Color(0x33b8b8d2),
                            offset: Offset(0,9),
                            blurRadius: 12,
                            spreadRadius: -4
                        )
                    ],
                  ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:  DataTable(
                            border: TableBorder.symmetric(inside: const BorderSide(color: Colors.grey,width: 1)),
                            horizontalMargin: MediaQuery.of(context).size.width/7.14,
                            columnSpacing:MediaQuery.of(context).size.width/6,
                         //   horizontalMargin: MediaQuery.of(context).size.width/80,
                         //   columnSpacing: MediaQuery.of(context).size.width/39,//22,
                            columns: createColumns(),
                            rows: List.generate(_uniqueData.length, (index) {

                              return DataRow(
                                  cells: [
                                    DataCell(
                                      Text(_uniqueData[index].dateCreation),
                                    ),
                                    DataCell(
                                      Text(_uniqueData[index].count.toString()),
                                    ),
                                  ]
                              );
                              },
                            ).toList(),
                          showBottomBorder: true,
                        ),
                      ),
                    ),
                  ],
                )
                    :
                ChartForReportingDossierEnlevement( data: _uniqueData.reversed,),
              ],
            ),
          );
        }
        else if (snapshot.hasError) {
          debugPrint(snapshot.hasError.toString());
          return const Text("Veuillez réesayer plus tard");
        }
        // By default show a loading spinner.
        return    const CircularProgressIndicator();
      },
    );
  }
  Widget _forChart(){
    return FutureBuilder<List<DossierEnlevement>>(
      future:  getVolumetrieDossierEnlevement(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          originalListDossier =  processDataByDate(snapshot.data!);

          if(snapshot.data!.isEmpty){ return const Text('La liste est vide');}

          return ChartForReportingDossierEnlevement( data: originalListDossier,);
        //  return ChartForReportingDossierEnlevement( data: _uniqueData,);
        }
        else if (snapshot.hasError) {
          debugPrint(snapshot.hasError.toString());
          return const Text("Veuillez réesayer plus tard");
        }
        // By default show a loading spinner.
        return    const CircularProgressIndicator();
      },
    );
  }

  Widget _detailCheck(){
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed:(){
          globalResponseMessage.loadingMessage("Triage en cours");
          setState(() {
            isDossierTrier=!isDossierTrier;
          });

        },

        child:Text('Trier',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
      ),
    );
  }

  List<DataColumn> createColumns() {
    return [
      const DataColumn(label: Text('DATE CREATION')),
      const DataColumn(label: Text('NBRE DOSSIERS')),

    ];
  }


}
