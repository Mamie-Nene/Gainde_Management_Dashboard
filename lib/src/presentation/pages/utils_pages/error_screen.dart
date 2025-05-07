import 'package:flutter/material.dart';

import '/src/utils/const/routes/app_routes_name.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed(AppRoutesName.homePage),
          child: const Text(" Cette page n'existe pas. Retour à la page d'accueil"),
        ),
      ),
    );
  }
}