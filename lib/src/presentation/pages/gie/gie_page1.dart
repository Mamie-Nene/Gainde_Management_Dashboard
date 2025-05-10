
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/src/presentation/pages/gie/reference.dart';
import '/src/presentation/pages/gie/solution.dart';
import '/src/utils/const/routes/app_routes_name.dart';
import '/src/utils/const/app_specifications/app_colors.dart';
import 'compte_certifier.dart';
import 'document_juridique.dart';

class GIEPage extends StatefulWidget {
  const GIEPage({super.key});

  @override
  State<GIEPage> createState() => _GIEPageState();
}
class _GIEPageState extends State<GIEPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  void _accueilPopUp(BuildContext context){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context)
        {
          return CupertinoAlertDialog(

            title: const Text("Retour à la page d'accueil"),

            content: const Text("Voulez vous retourner à la page d'accueil?"),

            actions: [

              CupertinoDialogAction(
                onPressed: () { Navigator.of(context).popUntil((route) => route.isFirst);},
                isDefaultAction: false,
                isDestructiveAction: false,
                child: const Text('Oui',style: TextStyle(fontWeight:FontWeight.w500)),
              ),

              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRoutesName.gieParts);
                },
                isDefaultAction: true,
                isDestructiveAction: true,

                child: const Text('Non'),
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      const DocumentJuridiquePage(),
      const CompteCertifierPage(),
      SolutionsScreen(),
      const ReferencePage(),

    ];

    void onItemTapped(int index, BuildContext context) {
      if (index == pageList.length) {
        _accueilPopUp(context);
      } else {

        setState(() {
          _currentIndex = index;
        });
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
          centerTitle:true,
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GIE Gainde2000',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 32,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.32,
                ),
              ),
              Text(
                'Documents juridiques',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xB2333333),
                  fontSize: 20,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.20,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body:pageList.elementAt(_currentIndex),
        bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF2962FF),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.70),
          selectedFontSize: 16,
          unselectedFontSize: 14,
          currentIndex: _currentIndex,
          //onTap: onItemTapped,
          onTap: (index) => onItemTapped(index, context), // Pass context to the function

          items: const [
            BottomNavigationBarItem(
                label: 'Documents juridiques',
                icon: Icon(Icons.file_copy_outlined)
            ),

            BottomNavigationBarItem(
              label: 'Compte Cert.',
              icon: Icon(Icons.file_copy_outlined)
            ),

            BottomNavigationBarItem(
              label:'Solutions',
              icon: Icon(Icons.file_copy_outlined)
            ),

            BottomNavigationBarItem(
              label: 'Références',
              icon: Icon(CupertinoIcons.doc_on_doc_fill),
              // icon: Icon(Icons.qr_code_scanner_outlined),
            ),
          ],
        )
    );
   /* return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Column(
          children: [
            Text(
              'GIE Gainde2000',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 32,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.32,
              ),
            ),
            Text(
              'Documents juridiques',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xB2333333),
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.20,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white /* Color */,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFF2CADD8) /* bleu-clair */,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child:
                      Text(
                        'Note de service',
                        style: TextStyle(
                          color: const Color(0xFF2CADD8) /* bleu-clair */,
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0x7FE0E0E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text('Arrêté',
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0x7FE0E0E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child:
                      Text(
                        'Loi',
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0x7FE0E0E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child:
                      Text(
                        'Réglements',
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0x7FE0E0E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child:
                      Text(
                        'Décret',
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white /* Color */,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0xFFF2F5F9),
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 15,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: ShapeDecoration(
                              color: const Color(0x19009EE0),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12,
                          top: 12.50,
                          child: Container(
                            width: 32,
                            height: 32,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          'Note de service 1',
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 24,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.24,
                          ),
                        ),
                        Text(
                          'Publié 10 mars 2022  • 103ko',
                          style: TextStyle(
                            color: const Color(0xFF666666),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Icon(Icons.save_alt)
                  ),
                ],
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard,color: Colors.blue,),
            label: 'Documents juridiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline),
            label: 'Compte Cert.',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Solution',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Référence',
          ),
        ],
      ),
    );*/
  }
}

class DossierCard extends StatelessWidget {
  final String title;
  final int count;

  const DossierCard({Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white54,
            child: Icon(Icons.folder_open, size: 28, color: Colors.black45),
          ),
          const SizedBox(height: 12),
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text("$count dossiers", style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
class ChartData {
  final String hour;
  final int count;

  ChartData(this.hour, this.count);
}
