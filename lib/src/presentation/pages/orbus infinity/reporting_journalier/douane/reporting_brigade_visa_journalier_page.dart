import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '/src/domain/local/donneebydateForVisaBrigade.dart';
import '/src/domain/remote/brigade/VisaBrigade.dart';
import '/src/data/remote/get_data_from_brigade.dart';

import '/src/utils/api/api_url.dart';
import '/src/utils/const/app_specifications/allDirectories.dart';
import '/src/utils/variable/global_variable.dart';

import '/src/presentation/widgets/AppTitleSecond.dart';
import '/src/presentation/widgets/custom_textfield.dart';


class ReportingJournalierForVisaBrigade extends StatefulWidget {
  const ReportingJournalierForVisaBrigade({Key? key}) : super(key: key);

  @override
  State<ReportingJournalierForVisaBrigade> createState() => _ReportingJournalierForVisaBrigadeState();
}

class _ReportingJournalierForVisaBrigadeState extends State<ReportingJournalierForVisaBrigade> {
  final _date1Key = GlobalKey<FormState>();
  final _date2Key = GlobalKey<FormState>();

  bool isForGraphique=false;
  bool isForVolumetrie=false;
  bool isDossierTrier=false;
  bool  _isRunning=false;

  int _pageSize = 10;

  bool _isLoading = false;
  List<VisaBrigade> visaGetted=[];


  String? dateGetted2;
  String? dateGetted1;
  String? date2;
  String? date1;

  List<int> countDataForMole=[];

  List<String>nomMoleForcount=[];

  DateTime firstDate = DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
  TextEditingController dateInputController1 = TextEditingController();
  TextEditingController dateInputController2 = TextEditingController(text: DateFormat('dd-MM-yyyy').format( DateTime.now()));

  final _scrollController = ScrollController();
  final searchController = TextEditingController();
  String textTapedOnSearch='';
  bool isResearchActif=false;
  bool _voirChartBrigade=false;

  late TooltipBehavior _tooltip;
  late List<_ChartData> chartData;
  List<DonneeByDateFromVisaBrigade> _uniqueData = []; //  late
  List<DonneeByDateFromVisaBrigade> originalListDossier=[];
  List<DonneeByDateFromVisaBrigade> dossierTrier=[];


  getVisaBrigade()async{
    setState(() {
      _isLoading = true;
      visaGetted.clear();
    });
    await GetDataForBrigadeApi().getVisaBrigadeEntreDate(ApiUrl().getListVisaEntreDate,date1!,date2!).then(
            (value) {
          setState(() {
            visaGetted.addAll(value);
            _isLoading = false;
          });
          getKeyAndCountVisaByDate(value);
        }
    ).onError((error, stackTrace) {
      setState(() {
        _isLoading = false;
      });
    });

  }
  getVisaBrigadeNew()async{
    setState(() {
      _isLoading = true;
    });
    await GetDataForBrigadeApi().getVisaBrigadeEntreDate(ApiUrl().getListVisaEntreDate,date1!,date2!).then(
            (value) {
          setState(() {
            originalListDossier=processDataByDate(value);
            _uniqueData= processDataByDate(value);
            _isLoading = false;
          });
        }
    ).onError((error, stackTrace) {
      setState(() {
        _isLoading = false;
      });
    });

  }

  List<DonneeByDateFromVisaBrigade> processDataByDate(List<VisaBrigade> data) {
    Map<String, DonneeByDateFromVisaBrigade> dateMap = {};
    for (var item in data) {
      if (dateMap.containsKey(item.dateEnregistrementTime.substring(0,10))) {
        // If date already exists, increment the count
        dateMap[item.dateEnregistrementTime.substring(0,10)]!.count += 1;
      } else {
        // If date does not exist, add it with the initial count of 1
        dateMap[item.dateEnregistrementTime.substring(0,10)] = DonneeByDateFromVisaBrigade(
          item.dateEnregistrementTime.substring(0,10),
          1,
        );
      }
    }

    // Convert the map to a list of DonneeFromVolumetrieBAD
    List<DonneeByDateFromVisaBrigade> uniqueData = dateMap.values.toList();

    return uniqueData;
  }


  getKeyAndCountVisaByDate(List<VisaBrigade> data) {
    Map<String, int> moleDataCounts = {};
    countDataForMole.clear();   nomMoleForcount.clear();
    data.forEach((value) {
      String key = value.dateEnregistrementTime.substring(0,10);
      if (moleDataCounts.containsKey(key)) {
        moleDataCounts[key] = moleDataCounts[key]! + 1;
      } else {
        moleDataCounts[key] = 1;
      }
    });

    // Printing the results for debugging
    moleDataCounts.forEach((key, count) {
      print('Mole: $key, Count: $count');
      //key = translateMoleByName(key);
      setState(() {
        countDataForMole.add(count);
        nomMoleForcount.add(key);
        print("key too $key");
        print(countDataForMole.length);
        _isLoading=false;
      });

    });

  }


  translateMoleByName(mole) {
    switch (mole) {
      case "M1":
        mole = "Môle 1";
        return mole ;
      case "M2":
        mole = "Môle 2";
        return mole ;
      case "M4":
        mole = "Môle 4";
        return mole ;
      case "M8":
        mole = "Môle 8";
        return mole ;
      case "M10":
        mole = "Môle 10";
        return mole ;

    }
  }

  @override
  void initState() {
    dateInputController1 = TextEditingController(text: DateFormat('dd-MM-yyyy').format(firstDate));
    date1 = DateFormat('yyyy-MM-dd').format(firstDate);
    date2 = DateFormat('yyyy-MM-dd').format(DateTime.now());
    dateGetted1=date1;
    dateGetted2=date2;
    isForVolumetrie=true;

    countDataForMole.clear();

    nomMoleForcount.clear();

    _tooltip = TooltipBehavior(enable: true);
    super.initState();

    getVisaBrigadeNew();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
              const AppTitleSecond(title: 'Reporting Journalier Visa Brigade',),

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
                //  width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/10.4,

                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                            key: _date1Key,
                            child: CustomTextfieldForDate(
                                dateController:  dateInputController1,
                                labelText: "Date de début",
                                action: () async {
                                  String date = await _dateFunction(dateInputController1,date1!);
                                  setState(() {
                                    dateGetted1 = date;
                                  });
                                }
                            )
                        ),
                        Form(
                            key: _date2Key,
                            child: CustomTextfieldForDate(
                                dateController:  dateInputController2,
                                labelText: "Date de fin",
                                action: () async {
                                  String date = await _dateFunction(dateInputController2,date2!);
                                  setState(() {
                                    dateGetted2 = date;
                                  });
                                }
                            )
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: AppDimensions.sizeboxHeight12),
                          child: IconButton(//Elevated Button
                              style:IconButton.styleFrom(
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10) ,bottomLeft: Radius.circular(10),topRight: Radius.circular(10) ,bottomRight: Radius.circular(10)),),
                                  backgroundColor: _isRunning?Colors.grey.shade300:AppColors.mainAppColor
                              ),
                              onPressed:
                              _isRunning?null:()async{
                                setState(() {
                                  _isRunning = true;
                                  date1=dateGetted1;
                                  date2=dateGetted2;
                                });
                                if (_date1Key.currentState!.validate()|| _date2Key.currentState!.validate()) {
                                  debugPrint('date1: $date1 date2:$date2');
                                  globalResponseMessage.loadingMessage("Résultat en cours");

                                    await getVisaBrigadeNew();
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
              ),

              _isLoading ?
              const Center(child: CircularProgressIndicator())
                  :
              _uniqueData.isEmpty?
              Text('Aucun résulat !')
              :
              SingleChildScrollView(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       // Text("${_uniqueData.length} Visas Brigade",style: TextStyle(fontSize: MediaQuery.textScaleFactorOf(context)*17),),
                        isForVolumetrie?
                        Column(
                          children: [
                            _trierCheck(),

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
                                child: SizedBox(
                                  child: DataTable(
                                    border: TableBorder.symmetric(inside: const BorderSide(color: Colors.grey,width: 1)),

                                    horizontalMargin: MediaQuery.of(context).size.width/7.14,
                                    columnSpacing:MediaQuery.of(context).size.width/6,


                                    columns: createColumns(),
                                    rows: List.generate(_uniqueData.length, (index) {
                                   // rows: List.generate(_uniqueData.length, (index) {

                                      return DataRow(
                                          cells: [
                                            DataCell(
                                              Text(_uniqueData[index].dateTraitement),
                                             // Text(nomMoleForcount[index]),
                                            ),
                                            DataCell(
                                              Text(_uniqueData[index].count.toString()),
                                            //  Text(countDataForMole[index].toString()),
                                            ),
                                          ]
                                      );
                                    },
                                    ).toList(),
                                    showBottomBorder: true,
                                  ),
                                ),
                              ),
                            ),
                          ]
                        )
                            :
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, AppDimensions.sizeboxHeight10, 0, AppDimensions.sizeboxHeight10),//30
                              margin: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight10, AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight10),//30
                              height: 500,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,color: Colors.white),
                              child: SfCartesianChart(
                                  legend:Legend(
                                    isVisible: true,
                                    position: LegendPosition.top,
                                  ),
                                  primaryXAxis: CategoryAxis(),
                                  // primaryYAxis: NumericAxis(minimum: 0,  maximum: 1700, interval: 500),
                                  primaryYAxis: NumericAxis(),
                                  tooltipBehavior: _tooltip,
                                  series: <CartesianSeries<_ChartData, String>>[
                                    LineSeries<_ChartData, String>(
                                        color: AppColors.mainGreenColor,
                                        dataSource:  List.generate(_uniqueData.length, (index) {
                                          var countResult = _uniqueData.reversed.elementAt(index).count;
                                          var dateVisa =_uniqueData.reversed.elementAt(index).dateTraitement;

                                          return _ChartData(dateVisa.substring(8,10), countResult);
                                        },
                                        ).toList(),
                                        name: 'Total Journalier des Visas Brigade',
                                        xValueMapper: (_ChartData data, _) => data.x,
                                        yValueMapper: (_ChartData data, _) => data.y
                                    ),

                                  ]
                              ),

                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, AppDimensions.sizeboxHeight10, 0, AppDimensions.sizeboxHeight10),//30
                              margin: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight10, AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight10),//30
                              height: 500,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,color: Colors.white),
                              child: SfCartesianChart(
                                  legend:Legend(
                                    isVisible: true,
                                    position: LegendPosition.top,
                                  ),
                                  primaryXAxis: CategoryAxis(),
                                  // primaryYAxis: NumericAxis(minimum: 0,  maximum: 1700, interval: 500),
                                  primaryYAxis: NumericAxis(),
                                  tooltipBehavior: _tooltip,
                                  series: <CartesianSeries<_ChartData, String>>[
                                    ColumnSeries<_ChartData, String>(
                                        dataSource: List.generate(_uniqueData.length, (index) {
                                          var countResult =_uniqueData.reversed.elementAt(index).count;
                                          var dateVisa =_uniqueData.reversed.elementAt(index).dateTraitement;

                                          return _ChartData(dateVisa.substring(8,10), countResult);
                                          },
                                        ).toList(),
                                        xValueMapper: (_ChartData data, _) => data.x,
                                        yValueMapper: (_ChartData data, _) => data.y,
                                        name: 'Total Journalier des Visas Brigade',
                                        color: Color(0xff474ce5)
                                    ),
                                  ]
                              ),

                            ),

                          ],
                        ),

                      ],
                    )
              )

            ],
        ),
      ),
    );
  }
  Widget _trierCheck(){
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed:(){
          globalResponseMessage.loadingMessage("Triage en cours");

          setState(() {
            isDossierTrier=!isDossierTrier;

            if(isDossierTrier){
              _uniqueData.sort((a, b) => b.count.compareTo(a.count));
            } else {
              _uniqueData = List.from(originalListDossier);
            }
          });

        },

        child:Text('Trier',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
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
      dateInputController.text = formattedDate; ///set output date to TextField value.;
      date = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
    return date;
  }
  List<DataColumn> createColumns() {
    return [
      const DataColumn(label: Text('DATE VISA')),
      const DataColumn(label: Text('NOMBRE DE VISAS')),

    ];
  }
}//navire conteneur flux entrée sortie camion

class CustomPaginatedDataTable extends StatelessWidget {
  final Widget? header;
  final List<DataColumn> columns;
  final DataTableSource source;
  final int rowsPerPage;
  final List<int> availableRowsPerPage;
  final void Function(int?)? onRowsPerPageChanged;

  CustomPaginatedDataTable({
    this.header,
    required this.columns,
    required this.source,
    required this.rowsPerPage,
    required this.availableRowsPerPage,
    this.onRowsPerPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        cardTheme: CardTheme(
          margin: const EdgeInsets.all(0),
         /* shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight:Radius.circular(16),), // Change radius
        ),*/
        ),
          dividerColor: Colors.black54,
          cardColor: Colors.white,

          //textTheme: TextTheme(caption: TextStyle(color: Colors.white))
      ),
      child: PaginatedDataTable(
        horizontalMargin:14,
        columnSpacing:30,
        arrowHeadColor:AppColors.mainAppColor,
        header: header,
        columns: columns,
        source: source,
        rowsPerPage: rowsPerPage,
        availableRowsPerPage: availableRowsPerPage,
        onRowsPerPageChanged: onRowsPerPageChanged,
        /*  actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(AppLocalizations.of(context)!.rowsPerPage),
          ),
        ],*/
      ),
    );
  }
}

class _DataSourceForVisaBrigade extends DataTableSource {
  final List<VisaBrigade> data;
  final BuildContext context;
  final ScrollController scrollController;

  _DataSourceForVisaBrigade(this.context, {required this.data, required this.scrollController,});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final item = data[index];
    String date = item.dateEnregistrementTime.split(".").first;
    return DataRow(
      cells: [
        DataCell(Text("${item.annee_decl} | ${item.bureau_decl} | ${item.numero_decl }")),
        DataCell(Text(item.chefBrigade)),
        DataCell(Text(item.agentEnregistrement)),
        DataCell(Text(date)),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final int y;
}