import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '/src/domain/remote/dossier_enlevement/DossierEnlevement.dart';

import '/src/utils/const/app_specifications/app_texts.dart';
import '/src/utils/variable/global_variable.dart';


class GetTotalDataApi{

  Future getDossierEntreDate(String URL,String date1, String date2)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    List<DossierEnlevement> dossier=[] ;
    try{
      var url= '$URL?dateEnregistreDemandeDebut=$date1&dateEnregistreDemandeFin=$date2';

      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      debugPrint("response.statusCode for statistic ${response.statusCode}");
      debugPrint("response.body  for statistic  ${response.body}");


      if (response.statusCode == 200) {
        prefs.setBool("accessToApiGD", true);
       List data = jsonDecode(response.body);
        dossier = data.map((e) => DossierEnlevement.fromJson(e)).toList();
        return dossier;

      }
      else if (response.statusCode == 403) {
        prefs.setBool("tokenIsRequiredGD", true);
        globalResponseMessage.errorMessage("Veuillez vous authentifier à nouveau !!");
      }
    }

    catch (e) {

      debugPrint("error throw: ${e.toString()}");
      // throw Exception("load dossier failed $e");
      return globalResponseMessage.errorMessage(AppText.NO_CONNECTION);

    }
  }


}