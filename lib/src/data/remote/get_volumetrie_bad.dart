import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '/src/domain/remote/consignataire/VolumetrieBAD.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/const/app_specifications/app_texts.dart';
import '/src/utils/variable/global_variable.dart';


class GetVolumetrieBAD{


  Future getVolumetrieBADPeriodique(String URL,String codeAction, String date1, String date2)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    print("getVolumetriePeriodique called");
    List<VolumetrieBAD> volumetrie =[]  ;
     try{
       var url= '$URL?codeAction=$codeAction&startDate=$date1&endDate=$date2';


       var response = await http.get(
          Uri.parse(url),
          headers: {
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          },
        );

        debugPrint("response.statusCode for get volumetrie periodique ${response.statusCode}");
        debugPrint("response.body for get volumetrie periodique ${response.body}");


        if (response.statusCode == 200) {
          prefs.setBool("accessToApiGD", true);
          List data = json.decode(response.body);
          if(data.isEmpty) return volumetrie;
          volumetrie = data.map((e) => VolumetrieBAD.fromJson(e)).toList();
          return volumetrie;

        }
       else if (response.statusCode == 403) {
          prefs.setBool("tokenIsRequiredGD", true);
          globalResponseMessage.errorMessage("Veuillez vous authentifier à nouveau !!");
        }
        else if (response.statusCode == 404) {
          globalResponseMessage.errorMessage("Pas de Traitement / Demande de BAD!!");
          return volumetrie;
        }
      }

      catch (e) {

        debugPrint("error throw: ${e.toString()}");
        // throw Exception("load dossier failed $e");
        return globalResponseMessage.errorMessage(AppText.NO_CONNECTION);

      }
    }


}