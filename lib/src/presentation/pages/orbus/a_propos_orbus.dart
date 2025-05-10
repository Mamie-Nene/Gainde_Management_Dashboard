import 'package:flutter/material.dart';

class AProposOrbus extends StatefulWidget {
  const AProposOrbus({super.key});

  @override
  State<AProposOrbus> createState() => _AProposOrbusState();
}

class _AProposOrbusState extends State<AProposOrbus> {

  @override
  Widget build(BuildContext context) {

    return  const Padding(
        padding: EdgeInsets.all(20.0),

        child: Column(
          children: [
            Text(
              'Le Guichet Unique des Services est une solution digitale de dernière génération favorisant la coordination de tous les acteurs de la logistique portuaire, aéroportuaire et les autres modes de transport.',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 24,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                height: 1.67,
                letterSpacing: 0.24,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Il réunit l\'ensemble des parties prenantes impliquées dans la chaîne de l\'enlèvement des marchandises, assurant ainsi transparence et suivi en temps réel du processus d\'enlèvement.',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 24,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                height: 1.67,
                letterSpacing: 0.24,
              ),
            ),
          ],
        ),
      );
  }

}
