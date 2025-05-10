import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DocumentJuridiquePage extends StatefulWidget {
  const DocumentJuridiquePage({super.key});

  @override
  State<DocumentJuridiquePage> createState() => _DocumentJuridiquePageState();
}

class _DocumentJuridiquePageState extends State<DocumentJuridiquePage> {

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            Text(
              'Documents juridiques',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xB2333333),
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.20,
              ),
            ),
            SizedBox(height: 20,),
            DefaultTabController(
               length: 6,  // Added
               initialIndex: 0,
               child: TabBar(
                  isScrollable: true,
                   labelColor: Color(0xff2CADD8),
                  unselectedLabelColor: Colors.grey,
                  tabs: ['Note de service', 'Arrêté', 'Loi', 'Règlements', 'Décret', 'Type de...']
                      .map((label) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: ShapeDecoration(
                            color: Colors.white /* Color */,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Tab(text: label)))
                      .toList(),
                 ),
             ),
            SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) =>Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
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
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius:56,
                      backgroundColor: Colors.blue[50],
                      //backgroundColor: Color(0x0f6AE01A),
                      child: SvgPicture.asset('asset/images/hugeicons_file-01.svg'),//color: Color(0xff2CADD8),
                    ),
                    title: Text('Note de service ${index + 1}',
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 24,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.24,
                      ),
                    ),
                    subtitle: Text('Publié 10 mars 2022 • 103ko',
                      style: TextStyle(
                        color: const Color(0xFF666666),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: SvgPicture.asset('asset/images/material-symbols_download-rounded.svg',color: Color(0xff666666),),
                    onTap: () {},
                  ),
                ),
              ),
            )
          ],
    );
    /*
    *Column(
          children: [
            DefaultTabController(
              length: 6,  // Added
              initialIndex: 0,
              child: TabBar(
                isScrollable: true,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: ['Note de service', 'Arrêté', 'Loi', 'Règlements', 'Décret', 'Type de...']
                    .map((label) => Tab(text: label))
                    .toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: Icon(Icons.description, color: Colors.blue),
                  ),
                  title: Text('Note de service ${index + 1}'),
                  subtitle: Text('Publié 10 mars 2022 • 103ko'),
                  trailing: Icon(Icons.download),
                  onTap: () {
                    // Handle download
                  },
                ),
              ),
            )
          ],
        ),
    * */
  }
}
