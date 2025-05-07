
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Gainde Management', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
              children: [
                // Search Bar
                Container(
                  margin: const EdgeInsets.only(bottom: 30,top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Rechercher un élement',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                 BoardCard(
                    title: "GIE",
                    logo: AppImages.LOGO_GAINDE,
                    color: Colors.deepPurpleAccent,
                    // avatarUrl: 'https://i.pravatar.cc/40?img=3',
                  ),
                const SizedBox(height: 30),
                 GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutesName.performanceOrbus);

                      },
                      child: BoardCard(title: "Performance ORBUS", logo: AppImages.LOGO_ORBUS, color: Colors.blue)),

                const SizedBox(height: 30),
                 GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutesName.orbusInfinityParts);
                        },
                      child: BoardCard(title: "Performance INFINITY", logo: AppImages.LOGO_ORBUS_INFINITY, color: Colors.purple)),

                const SizedBox(height: 80),
              ],
            ),
        ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 60.0,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Icon(Icons.dashboard, size: 28),
              SizedBox(width: 24),
              Icon(Icons.person_outline, size: 28),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

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
      height: 130,
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.8), color.withOpacity(0.5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage(logo),
                  maxRadius: 27,
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
              )
            ],
          ),

        ],
      ),
    );
  }
}