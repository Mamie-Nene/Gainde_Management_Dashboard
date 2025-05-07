
import 'package:flutter/material.dart';
import 'package:gainde_management_dashboard/src/utils/const/routes/app_routes_name.dart';

class MyHomePage1rstVersion extends StatefulWidget {
  const MyHomePage1rstVersion({super.key});

  @override
  State<MyHomePage1rstVersion> createState() => _MyHomePage1rstVersionState();
}

class _MyHomePage1rstVersionState extends State<MyHomePage1rstVersion> {


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

                // Recently Viewed
                const Text("Solutions ORBUS",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: [
                   Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutesName.myOrbusParts);
                        },
                          child: BoardCard(title: "Orbus", icon: Icons.data_usage_sharp, color: Colors.blue)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                           Navigator.of(context).pushNamed(AppRoutesName.orbusInfinityParts);
                          },
                          child: BoardCard(title: "Orbus Infinity", icon: Icons.space_dashboard_rounded, color: Colors.purple)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Your Workspaces
                const Text("GIE GAINDE2000",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
             /*   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Design Product"),
                    Row(
                      children: [
                        Icon(Icons.group, size: 18),
                        SizedBox(width: 4),
                        Text("Member(10)"),
                        SizedBox(width: 8),
                        Icon(Icons.settings, size: 18),
                      ],
                    )
                  ],
                ),*/
                const SizedBox(height: 10),

                Row(
                  children: const [
                    Expanded(
                      child: BoardCard(
                        title: "Données Administratives",
                        icon: Icons.file_copy_rounded,
                        color: Colors.deepPurpleAccent,

                       // avatarUrl: 'https://i.pravatar.cc/40?img=3',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BoardCard(
                        title: "Données Opérations",
                        icon: Icons.dns,
                        color: Colors.purple,

                       // avatarUrl: 'https://i.pravatar.cc/40?img=4',
                      ),
                    ),
                  ],
                ),
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
  final IconData icon;
  final Color color;
  final String? avatarUrl;

  const BoardCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
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
              Icon(icon, color: Colors.white),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16),
              )
            ],
          ),
          if (avatarUrl != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl!),
                radius: 14,
              ),
            )
        ],
      ),
    );
  }
}