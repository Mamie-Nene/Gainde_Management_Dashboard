import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/const/app_specifications/allDirectories.dart';



class AppTitleSecond extends StatelessWidget {
  final String title;
  const AppTitleSecond({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        padding:  EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth15, AppDimensions.sizeboxHeight20, AppDimensions.sizeboxWidth15, AppDimensions.sizeboxHeight10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BackButton(onPressed: (){Navigator.pop(context);},),
               Text(title,
                  style:TextStyle(
                    fontSize: MediaQuery.textScaleFactorOf(context)*20,
                  ),
                )
              ],
            ),

          ],
        ),
      );
  }
}
