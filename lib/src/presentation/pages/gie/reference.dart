import 'package:flutter/material.dart';

class ReferencePage extends StatefulWidget {
  const ReferencePage({super.key});

  @override
  State<ReferencePage> createState() => _ReferencePageState();
}

class _ReferencePageState extends State<ReferencePage> {

  @override
  Widget build(BuildContext context) {
    List<String> images =[ 'assets/images/world_bank.png', 'assets/images/giz.png', 'assets/images/douanes.png', 'assets/images/apix.png', 'assets/images/adepme.png', 'assets/images/petrogabon.png', 'assets/images/kra.png'];

    return SingleChildScrollView(
        child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(16),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: images.map((logo) => Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(logo, fit: BoxFit.contain),
                  ),
                )).toList(),
              ),
            )
    );
  }
}
