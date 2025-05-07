import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import '/src/domain/remote/brigade/SortieBrigade.dart';
import '/src/domain/remote/brigade/VisaBrigade.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/src/domain/remote/brigade/SortieBrigadeDataByActeur.dart';
import '/src/utils/const/app_specifications/app_texts.dart';

import '/src/utils/variable/global_variable.dart';


class GetDataForBrigadeApi{

  Future getVisaBrigadeDuJour(String URL,String date)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString("tokenDouane");

    List<VisaBrigade> visaBrigades=[];
    try{
      var url= '$URL?date=$date';
        var response = await http.get(
          Uri.parse(url),
          headers: {
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          },
        );

        debugPrint("response.statusCode to get data for visa birgade ${response.statusCode}");
        debugPrint("response.body to get data for visa birgade ${response.body}");

        if (response.statusCode == 200) {
          prefs.setBool("accessToApiGD", true);

          List data = jsonDecode(response.body);

          visaBrigades = data.map((e) => VisaBrigade.fromJson(e)).toList();
          return visaBrigades;

        }
       else if (response.statusCode == 403) {
          prefs.setBool("tokenIsRequiredGD", true);
          globalResponseMessage.errorMessage("Veuillez vous authentifier à nouveau !!");
        }
      }

      catch (e) {

        debugPrint("error throw: ${e.toString()}");
       return globalResponseMessage.errorMessage(AppText.NO_CONNECTION);

      }
    }
  Future getVisaBrigadeEntreDate(String URL,String date1,String date2)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

  //  var token = prefs.getString("tokenDouane");
    var token = prefs.getString("token");

    List<VisaBrigade> visaBrigades=[];

    try{
      var url= '$URL?startDate=$date1&endDate=$date2';
      print(url);
        var response = await http.get(
          Uri.parse(url),
          headers: {
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          },
        );

        debugPrint("response.statusCode to get data for visa birgade ${response.statusCode}");
        debugPrint("response.body to get data for visa birgade ${response.body}");

        if (response.statusCode == 200) {
          prefs.setBool("accessToApiGD", true);

          List data = jsonDecode(response.body);

          visaBrigades = data.map((e) => VisaBrigade.fromJson(e)).toList();
          return visaBrigades;

        }
       else if (response.statusCode == 403) {
          prefs.setBool("tokenIsRequiredGD", true);
          globalResponseMessage.errorMessage("Veuillez vous authentifier à nouveau !!");
        }
      }

      catch (e) {

        debugPrint("error throw: ${e.toString()}");
       return globalResponseMessage.errorMessage(AppText.NO_CONNECTION);

      }
    }

  Future getSortieBrigadeDuJour(String URL,String date)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString("token");
   // var token = prefs.getString("tokenDouane");

    List<SortieBrigade> sortieBrigade=[];
    try{
      var url= '$URL?dateSortieDouane=$date';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      debugPrint("response.statusCode to get data for sortie birgade ${response.statusCode}");
      debugPrint("response.body to get data for sortie birgade ${response.body}");

      if (response.statusCode == 200) {
        prefs.setBool("accessToApiGD", true);

        List data = jsonDecode(response.body);
        sortieBrigade = data.map((e) => SortieBrigade.fromJson(e)).toList();
        print(sortieBrigade);

        return sortieBrigade;

      }
      else if (response.statusCode == 403) {
        prefs.setBool("tokenIsRequiredGD", true);
        globalResponseMessage.errorMessage("Veuillez vous authentifier à nouveau !!");
      }
    }

    catch (e) {

      debugPrint("error throw: ${e.toString()}");
      return globalResponseMessage.errorMessage(AppText.NO_CONNECTION);

    }
  }
  Future getSortieBrigadeEntreDate(String URL,String date1,String date2)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

   // var token = prefs.getString("tokenDouane");
    var token = prefs.getString("token");

    List<SortieBrigade> sortieBrigade=[];
    try{
      var url= '$URL?startDate=$date1&endDate=$date2';
      print(url);
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      debugPrint("response.statusCode to get data for sortie birgade ${response.statusCode}");
   //   debugPrint("response.body to get data for sortie birgade ${response.body}");

      if (response.statusCode == 200) {
        prefs.setBool("accessToApiGD", true);

        List data = jsonDecode(response.body);
        sortieBrigade = data.map((e) => SortieBrigade.fromJson(e)).toList();
        print(sortieBrigade);

        return sortieBrigade;

      }
      else if (response.statusCode == 403) {
        prefs.setBool("tokenIsRequiredGD", true);
        globalResponseMessage.errorMessage("Veuillez vous authentifier à nouveau !!");
      }
    }

    catch (e) {

      debugPrint("error throw: ${e.toString()}");
      return globalResponseMessage.errorMessage(AppText.NO_CONNECTION);

    }
  }

  Future getSortieBrigadeByActeurEntreDate(String URL,String date1, String date2)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString("token");

    List<SortieBrigadeDataByActeur> sortieBrigadeByActeur=[];
    try{
      var url= '$URL?startDate=$date1&endDate=$date2';
      print(url);
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      debugPrint("response.statusCode to get data for sortie birgade ${response.statusCode}");
      debugPrint("response.body to get data for sortie birgade ${response.body}");

      if (response.statusCode == 200) {
        prefs.setBool("accessToApiGD", true);

        List data = jsonDecode(response.body);
        sortieBrigadeByActeur = data.map((e) => SortieBrigadeDataByActeur.fromJson(e)).toList();

        return sortieBrigadeByActeur;

      }
      else if (response.statusCode == 403) {
        prefs.setBool("tokenIsRequiredGD", true);
        globalResponseMessage.errorMessage("Veuillez vous authentifier à nouveau !!");
      }
    }

    catch (e) {

      debugPrint("error throw: ${e.toString()}");
      return globalResponseMessage.errorMessage(AppText.NO_CONNECTION);

    }
  }

}