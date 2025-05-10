
import 'package:flutter/material.dart';

import '/src/utils/const/app_specifications/app_images.dart';
import '/src/utils/const/routes/app_routes_name.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF2F5F9),
    /*  appBar: AppBar(
        leading: Container(
          width: 40,
          height: 40,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/67x67"),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 2.67,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xFF02566B) /* Primary-color */,
              ),
              borderRadius: BorderRadius.circular(133.25),
            ),
          ),
        ) ,
        title:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Moussa Ndiaye',
                      style: TextStyle(
                        color: Color(0xFF333333) /* Text-Color */,
                        fontSize: 22.21,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        height: 1.40,
                      ),
                    ),
                    Text(
                      'DGD',
                      style: TextStyle(
                        color: Color(0xFF333333) /* Text-Color */,
                        fontSize: 16.83,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                      ),
                    )
                  ]
              ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),*/
      body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 30),
          child: ListView(
              children: [
                SizedBox(
                  width: 276,
                  height: 100,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 13.88,
                    children: [
                      Container(
                        width: 66.63,
                        height: 66.63,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/images/user.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2.67,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: const Color(0xFF02566B) /* Primary-color */,
                            ),
                            borderRadius: BorderRadius.circular(133.25),
                          ),
                        ),
                      ),
                      Container(
                        width: 182,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Moussa Ndiaye',
                              style: TextStyle(
                                color: const Color(0xFF333333) /* Text-Color */,
                                fontSize: 22.21,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                                height: 1.40,
                              ),
                            ),
                            Text(
                              'DGD',
                              style: TextStyle(
                                color: const Color(0xFF333333) /* Text-Color */,
                                fontSize: 16.83,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w500,
                                height: 1.40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutesName.gieParts);
                    },
                    child:BoardCard(
                    title: 'GIE - GAINDE2000',
                    logo: AppImages.GIE_SVG,
                    color: Colors.deepPurpleAccent,
                    // avatarUrl: 'https://i.pravatar.cc/40?img=3',
                  )),
                const SizedBox(height: 30),

                 GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutesName.performanceOrbus);

                      },
                      child: BoardCard(title: "Performance ORBUS", logo: AppImages.ORBUS_SVG, color: Colors.blue)),

                const SizedBox(height: 30),
                 GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutesName.orbusInfinityParts);
                        },
                      child: BoardCard(title: "Performance INFINITY", logo: AppImages.ORBUS_SVG, color: Colors.purple)),

                const SizedBox(height: 80),
              ],
            ),
        ),

    );
  }
}

//chat
/*

    return Scaffold(
      backgroundColor:  Color(0xFFF2F5F9),

      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://example.com/profile.jpg'),
                radius: 24,
              ),
              title: Text('Moussa Ndiaye'),
              subtitle: Text('DGD'),
            ),
            Divider(),
            _buildMenuItem(Icons.account_balance, 'GIE - GAINDE2000'),
            _buildMenuItem(Icons.public, 'Performance ORBUS'),
            _buildMenuItem(Icons.public, 'Performance Infinity'),
          ],
        ),
      )
    );

  }
  Widget _buildMenuItem(IconData icon, String title) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navigate to section
        },
      ),
    );
  }
 */
class BoardCard extends StatelessWidget {
  final String title;
  final String logo;
  final Color color;

  const BoardCard({
    super.key,
    required this.title,
    required this.logo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: ShapeDecoration(

        color: Colors.white /* Color */,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 25,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF2F5F9),
                      shape: OvalBorder(),
                      image: DecorationImage(
                        image: AssetImage(logo),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(title,
                    style: TextStyle(
                      color: const Color(0xFF2C3E50),
                      fontSize: 24,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
               Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF2F5F9),
                          shape: OvalBorder(),
                        ),
                 child:   Icon(Icons.arrow_forward_ios,size: 15,)
                      ),
            ],
          )
      ),
    );
  }
}