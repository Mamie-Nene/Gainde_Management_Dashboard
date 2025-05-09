
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/remote/get_statistic_data.dart';
import '/src/domain/remote/statistics/TotalDataForStatistics.dart';

import '/src/utils/api/api_url.dart';
import '/src/utils/const/app_specifications/app_colors.dart';
import '/src/utils/const/routes/app_routes_name.dart';
import '/src/utils/variable/global_variable.dart';
import '/src/utils/const/app_specifications/app_dimensions.dart';
import '../../../widgets/custom_textfield.dart';


class StatistiquesOrbusInfinityPage extends StatefulWidget {
  const StatistiquesOrbusInfinityPage({Key? key}) : super(key: key);

  @override
  State<StatistiquesOrbusInfinityPage> createState() => _StatistiquesOrbusInfinityPageState();
}

class _StatistiquesOrbusInfinityPageState extends State<StatistiquesOrbusInfinityPage> {
  final _date1Key = GlobalKey<FormState>();
  final _date2Key = GlobalKey<FormState>();

  bool _isRunning=false;

  String? date1;
  String? date2;
  String? dateGetted1;
  String? dateGetted2;

  DateTime firstDate = DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
  TextEditingController dateInputController1 = TextEditingController();
  TextEditingController dateInputController2 = TextEditingController(text: DateFormat('dd-MM-yyyy').format( DateTime.now()));


  Future<TotalDataForStatistics> getTotalDossierForStatistics()async{
    var data = await GetStatisticDataApi().getTotalDataForStatistic(ApiUrl().getTotalDataForStatistics,date1!,date2!);
    return data;
  }

  @override
  void initState() {

    dateInputController1 = TextEditingController(text: DateFormat('dd-MM-yyyy').format(firstDate));
    date1= DateFormat('yyyy-MM-dd').format(firstDate);
    date2= DateFormat('yyyy-MM-dd').format(DateTime.now());
    dateGetted1=date1;
    dateGetted2=date2;
  //  getTotalDossierForStatistics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> type = ["Dossiers",'Visas PAD','BAE','DO','BAD','Sorties'];
    List<String> valuesGetted = ["5000",'1000','3000','3000','3000','3000'];
    List<Color> colors= [AppColors.mainAppColor, Color(0xff474ce5),Colors.purple,Color(0xff4C5CBE),Color(0xff5D99F4),AppColors.mainGreenColor,];

    return  SingleChildScrollView(

      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/10.4,

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Form(
                            key: _date1Key,
                            child: CustomTextfieldForDate(
                                dateController: dateInputController1,
                                labelText: "Date de début",
                                // action:  () =>_dateFunction(dateController: dateInputController1,date: date1)
                               //bon  action:  () =>_dateFunction1(dateInputController1,date1!)
                                action:  () async {
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
                                //  action:  () =>_dateFunction(dateController: dateInputController2,date: date2)
                                // bon action:  () =>_dateFunction2(dateInputController2,date2!)
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
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10) ,bottomLeft: Radius.circular(10),topRight: Radius.circular(10) ,bottomRight: Radius.circular(10)),),
                            backgroundColor: _isRunning?Colors.grey.shade300:Colors.purple
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

                                 await getTotalDossierForStatistics();
                                 //await GetTotalDataApi().getTotalDataForStatistic(ApiUrl().getTotalDataForStatistics,date1!,date2!);

                                }
                                setState(() {
                                  _isRunning = false;
                                });
                              },
                        child: Icon(Icons.search)
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
                  height: MediaQuery.of(context).size.height/4.6,
                  width: MediaQuery.of(context).size.width,
                  child:GridView.builder(
                    itemCount:type.length,
                    physics:const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.7),
                      //childAspectRatio: 0.8,
                      mainAxisSpacing: AppDimensions.sizeboxHeight10,
                      crossAxisSpacing: AppDimensions.sizeboxHeight15,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          // color: const Color(0xff4c80e5), AppColors.secondBlueAppColor,
                            color: colors[index],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(valuesGetted[index].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]} "),
                                style:  TextStyle(
                                    fontSize: MediaQuery.textScaleFactorOf(context)*20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height:10),
                              Text(type[index],
                                style:  TextStyle(
                                    fontSize:MediaQuery.textScaleFactorOf(context)* 16,
                                    color:Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      },
                  ),
                ),

          Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
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

          _menu(context),

        ],
      ),
    );

  }

  Widget _menu(BuildContext context){
    List<String> entries=["Stats Consignataire", "Stats Brigade" ,"Stats Manifeste","Stats Avarnav","Stats Manutentionnaire",];

    List<String> values=["Statistique sur les Consignataires","Statistique sur les visas/sorties Brigade", "Statistique sur les Manifestes","Statistique sur les arrivées navire","Statistique sur les Manutentionnaires"];

    List<IconData> icons=[Icons.table_chart,Icons.insert_chart_outlined_rounded,Icons.stacked_line_chart_sharp,Icons.bubble_chart,Icons.pie_chart,];//Icons.ssid_chart

    List<VoidCallback> actions=[
          (){Navigator.of(context).pushNamed(AppRoutesName.volumetrieConsignatairePage);},
          (){Navigator.of(context).pushNamed(AppRoutesName.volumetrieBrigadePage);},
          (){Navigator.of(context).pushNamed(AppRoutesName.manifestPage);},
          (){Navigator.of(context).pushNamed(AppRoutesName.volumetriePADPage);},
          (){Navigator.of(context).pushNamed(AppRoutesName.volumetrieMannutentionnairePage);},
    ];

    return
      SizedBox(
        height: MediaQuery.of(context).size.height/2,
        child: ListView.separated(
          shrinkWrap: true, // Prevents ListView from expanding infinitely
          itemCount:entries.length,
        //  physics:const BouncingScrollPhysics(),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: actions[index],
              child: Container(
                padding: EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth10,AppDimensions.sizeboxHeight5 ,0,AppDimensions.sizeboxHeight5),
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
}