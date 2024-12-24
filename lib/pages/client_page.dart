
import 'package:delevery_app/config/app_route.dart';
import 'package:flutter/material.dart';

import '../components/app_service_card.dart';

class Client extends StatelessWidget {
  const Client({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          //color: Colors.black87, // Retained the dark background color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50), // Space at the top
            // Welcome Text
           const  Text(
              "Bienvenue sur Morivo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            // Subtitle Text
            const Text(
              "Services Disponibles",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Service Section
            Expanded(
              child: ListView(
                children: [
                  ServiceCard(
                    onImageTap: (){
                      Navigator.of(context).pushNamed(AppRoute.deleveryPage);
                    },
                    imagePath: 'assets/images/livreure.jpg',
                    title: 'Livreur',
                    description: 'Rapide et efficace',
                  ),
                   ServiceCard(
                    onImageTap: (){
                      print("Restaurant est cliqué");
                    },
                    imagePath: 'assets/images/restaurant.jpg',
                    title: 'Restaurant',
                    description: 'Nouriture aggreable et accessible',
                  ),
                  /*ServiceCard(
                    imagePath: 'assets/images/service3.jpg',
                    title: 'Service Three',
                    description: 'Description for service three',
                  ),*/
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Footer
            const Text(
              "Merci d'avoir choisi Morivo!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

  }
}
