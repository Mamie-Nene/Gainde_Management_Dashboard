// Solutions Screen
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SolutionsScreen extends StatelessWidget {
  const SolutionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Solutions',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xB2333333),
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.20,
              ),
            ),
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Recherche',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Solutions Cards
            Row(
              children: [
                Expanded(
                  child: _buildSolutionCard(
                    'Orbus Paiement',
                    'Paiement',
                    'C\'est votre solution de paiement électronique qui fédère les différents moyens de paiement (visa, master card, mobile paiement, cash...',
                    'asset/images/orbus_paiement.png',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSolutionCard(
                    'Confiance Factory',
                    'Numérique',
                    'C\'est la première autorité de certification de l\'Afrique de l\'ouest qui met à votre disposition des solutions de sécurité électronique',
                    'asset/images/LOGO B-TRUST-01 1.png',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildSolutionCard(
                    'Orbus Suite',
                    'Numérique',
                    'C\'est votre solution de guichet unique du commerce électronique reconnue et citée dans les ouvrages de référence...',
                    'asset/images/orbus_suite.jpeg',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSolutionCard(
                    'Démat Academy',
                    'Éducation',
                    'En partenariat avec HEC Paris c\'est l\'entité qui vous forme aux nouveaux enjeux de la transformation digitale...',
                    'asset/images/demat.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }

  Widget _buildSolutionCard(String title, String category, String description, String logoPath) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                color: Colors.transparent,
                child: Image.asset(logoPath), // Replace with actual logo
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 1.10,
                        letterSpacing: 0.20,
                      ),
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        height: 1.38,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              height: 1.38,
              letterSpacing: 0.16,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'En savoir plus',
                  style: TextStyle(color: Color(0xff2CADD8)),
                ),
                const SizedBox(width: 8),
              SvgPicture.asset('asset/images/material-symbols_download-rounded.svg')
              ],
            ),
          ),
        ],
      ),
    );
  }
}