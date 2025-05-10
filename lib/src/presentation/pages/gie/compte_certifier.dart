// Certified Accounts Screen
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompteCertifierPage extends StatelessWidget {
  const CompteCertifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Comptes certifiés',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xB2333333),
              fontSize: 20,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.20,
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
              child: Container(
                padding:const EdgeInsets.only(left: 10,right: 10,),
                color: Colors.white,
                child: Column(
                  children: [
                    _buildFinancialDocumentItem(
                      'États financiers N',
                      'Publié 10 mars 2022',
                      '103ko',
                    ),
                    const Divider(),
                    _buildFinancialDocumentItem(
                      'États financiers N-1',
                      'Publié 10 mars 2022',
                      '103ko',
                    ),
                    const Divider(),
                    _buildFinancialDocumentItem(
                      'États financiers 2023',
                      'Publié 10 mars 2022',
                      '103ko',
                    ),
                  ],
                ),
              )
              )

        ],
      );
  }

  Widget _buildFinancialDocumentItem(String title, String date, String size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child:CircleAvatar(
              maxRadius:56,
              backgroundColor: Colors.blue[50],
              //backgroundColor: Color(0x0f6AE01A),
              child: SvgPicture.asset('asset/images/hugeicons_file-01.svg'),//color: Color(0xff2CADD8),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$date • $size',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset('asset/images/material-symbols_download-rounded.svg',color: Color(0xff666666),),
        ],
      ),
    );
  }

  Widget _buildBottomBarItem(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}