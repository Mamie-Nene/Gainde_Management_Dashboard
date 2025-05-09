import 'package:flutter/material.dart';

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
