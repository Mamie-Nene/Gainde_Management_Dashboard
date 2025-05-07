
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/src/utils/const/app_specifications/app_colors.dart';

import '/src/utils/const/app_specifications/app_dimensions.dart';

class CustomFormTextFieldForUsername extends StatelessWidget {
  // final String labelText;
  final String placeholder;
  final TextEditingController controller;

  const CustomFormTextFieldForUsername( {super.key, required this.placeholder, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width/1.2,
      child: TextFormField(
        // textAlign : TextAlign.center,
          controller: controller,
          keyboardType: TextInputType.text,
          inputFormatters:[FilteringTextInputFormatter.deny(RegExp(r'\s'))] ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez remplir ce champs';
            }
            return null;
          },
          decoration:   InputDecoration(
              border: const OutlineInputBorder() ,
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                  color:AppColors.mainAppColor,
                  width: 1.0,
                ),
              ),
              fillColor:Colors.white,
              filled: true,
              contentPadding:  EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth20, 0, AppDimensions.sizeboxWidth20, 0),
              // border: InputBorder.none,
              labelStyle:  const TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xff000000),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              labelText : placeholder

          )
      ),
    );
  }
}

class CustomFormTextFieldForPassword extends StatelessWidget {

  final String placeholder;
  final TextEditingController controller;
  final bool passwordVisible;
  final Widget action;

  const CustomFormTextFieldForPassword( {super.key, required this.placeholder, required this.controller, required this.passwordVisible, required this.action});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      // textAlign : TextAlign.center,
        controller: controller,
        keyboardType: TextInputType.text,
        inputFormatters:[FilteringTextInputFormatter.deny(RegExp(r'\s'))] ,
        obscureText: !passwordVisible,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez remplir ce champs';
          }
          return null;
        },
        decoration:   InputDecoration(
            suffixIcon:  action,
            border: const OutlineInputBorder() ,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.mainAppColor,
                width: 1.0,
              ),
            ),
            fillColor:Colors.white,
            filled: true,
            contentPadding:  EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth20, 0, AppDimensions.sizeboxWidth20, 0),
            // border: InputBorder.none,
            labelStyle:  const TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xff000000),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            labelText : placeholder

        )
    );
  }
}

class CustomTextfieldForDate extends StatelessWidget {
  final TextEditingController dateController;
  final String labelText;
  final VoidCallback? action;
  const CustomTextfieldForDate({Key? key, required this.dateController, required this.labelText, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.fromLTRB(2, AppDimensions.sizeboxHeight10, AppDimensions.sizeboxWidth20, 0),
        width: MediaQuery.of(context).size.width/2.6,
        child: TextFormField(
            readOnly: true,
            controller: dateController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez remplir ce champs';
              }
              return null;
            },
            decoration:  InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: labelText,
              labelStyle:  TextStyle(
                fontFamily: 'Poppins',
                color: const Color(0xff000000),
                fontSize: MediaQuery.textScaleFactorOf(context)*14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              ),
              contentPadding:EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth20, AppDimensions.sizeboxHeight20, AppDimensions.sizeboxWidth10, AppDimensions.sizeboxHeight10)  ,

              border: const OutlineInputBorder() ,
              enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            onTap: action
        ),

      );
  }
}

class CustomFormTextFieldForDeclaration extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final VoidCallback action;
  final List<TextInputFormatter>? inputFormatters;

  const CustomFormTextFieldForDeclaration({Key? key,required this.placeholder, required this.controller, required this.action, required this.inputFormatters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width/4.5,
        child: TextFormField(
            onTap: action,
            controller: controller,
            keyboardType: TextInputType.text,
            inputFormatters:inputFormatters,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'A Remplir';
              }
              return null;
            },
            decoration:   InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                labelStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff505050),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                labelText:placeholder
            )
        )
    );
  }
}

class CustomFormTextFieldForRepertoireRecherche extends StatelessWidget {
  // final String labelText;
  final String placeholder;
  final TextEditingController controller;

  const CustomFormTextFieldForRepertoireRecherche( {super.key, required this.placeholder, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width/1.6,
      child: TextFormField(
        // textAlign : TextAlign.center,
          controller: controller,
          keyboardType: TextInputType.text,
          inputFormatters:[FilteringTextInputFormatter.deny(RegExp(r'\s'))] ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez remplir ce champs';
            }
            return null;
          },
          decoration:   InputDecoration(
              border: const OutlineInputBorder() ,
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                  color:AppColors.mainAppColor,
                  width: 1.0,
                ),
              ),
              fillColor:Colors.white,
              filled: true,
              contentPadding:  EdgeInsets.fromLTRB(AppDimensions.sizeboxWidth20, 0, AppDimensions.sizeboxWidth20, 0),
              // border: InputBorder.none,
              labelStyle:  const TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xff000000),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              labelText : placeholder

          )
      ),
    );
  }
}

