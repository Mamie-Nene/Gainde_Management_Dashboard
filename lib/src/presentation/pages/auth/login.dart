import 'package:flutter/material.dart';
import '/src/utils/const/routes/app_routes_name.dart';


import '/src/utils/const/app_specifications/app_images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final _usernameController=TextEditingController();
  final _passwordController=TextEditingController();
  bool _isPasswordVisible = false;
  bool _isRunning = false;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor= MediaQuery.textScaleFactorOf(context);
    final size= MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 200.0),
        child: Column(
            children: [
              Container(
                height: 106.15,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.LOGO_GAINDE),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const Text(
                'Connexion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.20,
                ),
              ),
              const SizedBox(height: 30,),
               Form(
                    key: _loginKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      child:Column(
                     // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 32,
                      children: [
                         Column(
                          //  mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: [
                              Text(
                                'Identifiant',
                                style: TextStyle(
                                  color: const Color(0xFF646B78),
                                            fontSize: 20,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                              Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFF4F6F9),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            spacing: 10,
                                            children: [
                                              Text(
                                                'Saisir ',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: const Color(0xFFAFB7C7),
                                                  fontSize: 14,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                            ],
                          ),
                         Column(
                          // mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           spacing: 12,
                           children: [
                             Text(
                                        'Mot de passe',
                                        style: TextStyle(
                                          color: const Color(0xFF646B78),
                                          fontSize: 20,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                             Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF4F6F9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          spacing: 10,
                                          children: [
                                            Text(
                                              '*********',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: const Color(0xFFAFB7C7),
                                                fontSize: 14,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                           ],
                         ),
                      ]
                    ),
                    )
                ),
              const SizedBox(height: 30,),
              const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 150),
                      child: Text(
                            'Mot de passe oublié ?',
                            style: TextStyle(
                              color: Color(0xFF02566B),
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    ),
                  ),
              const SizedBox(height: 30,),
              Container(
                width: MediaQuery.of(context).size.width/1.6,
                      height: 85,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 17),

                      child:  TextButton(
                          style:TextButton.styleFrom(
                              backgroundColor: const Color(0xFF1F5DAB),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFF1F5DAB) /* blue-fonce */,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        onPressed: (){Navigator.of(context).pushNamed(AppRoutesName.homePage);},
                        child: Text(
                                    'Se connecter',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                    ),

                              ),
                      ),
                        ),
            ],
          ),
      ),
    ) ;
    /*return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
            children: [
              Image.asset(AppImages.LOGO_GAINDE),

              Form(
                key:_loginKey,
                child: Column(
                  children: [
                    Text('Connexion',
                      textAlign:TextAlign.center ,
                      style: TextStyle(
                        fontSize: MediaQuery.textScaleFactorOf(context)*24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff212121),
                        fontFamily: "Lato",
                        fontStyle: FontStyle.normal,
                        letterSpacing: 1.20,
                        //  line-height: normal,

                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height/18,),
                   //         dessin
                    /* Container(
                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.86),
                      width: 149.28,
                      height: 149.28,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.30,
                      child: Container(
                        transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.86),
                        width: 149.28,
                        height: 149.28,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                    ),*/
                    Text('Identifiant',style: TextStyle(
                      color: Color(0xff646B78),//darkgrey
                      fontSize: textScaleFactor*20,//14
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontFamily: "Lato",
                        //font-feature-settings: 'liga' off, 'clig' off;
                      //  line-height: normal;
                    ),
                    ),

                    CustomFormTextFieldForUsername(placeholder: 'Saisir', controller: _usernameController,),

                    SizedBox(height: MediaQuery.of(context).size.height/26,),
                    Text(
                      'Mot de passe',
                      style: TextStyle(
                        color: const Color(0xFF646B78),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    CustomFormTextFieldForPassword(
                      placeholder: '*******',
                      controller: _passwordController,
                      passwordVisible:_isPasswordVisible,

                      action:IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ?Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.mainAppColor,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: (){},
                          child:  Text(
                            'Mot de passe oublié ?',
                            style: TextStyle(
                              color: const Color(0xFF02566B),
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                      ),
                    ),

                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 155),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 17),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1F5DAB) /* blue-fonce */,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFF1F5DAB) /* blue-fonce */,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: TextButton(
                    onPressed: _isRunning? null : () async {
                      setState(() {
                        _isRunning=true;
                      });
                      if (_loginKey.currentState!.validate()) {
                      }
                      setState(() {
                        _isRunning=false;
                      });
                    },
                    child: Text(
                        'Se connecter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                  ),
                ),
              ),
                ))

              // dessin
              /*Opacity(
                opacity: 0.30,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.86),
                  width: 149.28,
                  height: 149.28,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
              Container(
                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.86),
                width: 149.28,
                height: 149.28,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              )*/
            ],
          ),
      ),
    ) ;*/
  }



}
