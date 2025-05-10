import 'package:flutter/material.dart';

class ReferencePage extends StatefulWidget {
  const ReferencePage({super.key});

  @override
  State<ReferencePage> createState() => _ReferencePageState();
}

class _ReferencePageState extends State<ReferencePage> {

  @override
  Widget build(BuildContext context) {
    List<String> images =[ 'asset/images/word_bank.png', 'asset/images/giz.png', 'asset/images/douanes.png', 'asset/images/apix.png', 'asset/images/adepme.png', 'asset/images/petrogabon.png', 'asset/images/kra.png'];

    return SingleChildScrollView(
        child: Column(
          children: [
            const Text('Références',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xB2333333),
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.20,
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(16),
                mainAxisSpacing: 20,
                crossAxisSpacing: 16,
                children: images.map(
                      (logo) =>
                        Container(
                          decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          child: Image.asset(
                            logo,
                            height: 12,
                            scale: 1.5,
                          )
                        ),
                ).toList(),
              ),
            ),
          ],
        )
    );
  }
}
