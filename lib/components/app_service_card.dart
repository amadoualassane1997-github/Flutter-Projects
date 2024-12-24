import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onImageTap; // Callback for image tap action

  const ServiceCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onImageTap, // Add this parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Clickable Circle Image
        GestureDetector(
          onTap: onImageTap, // Invoke the provided callback
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.grey[800],
          ),
        ),
        SizedBox(height: 10),
        // Title
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        // Description
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
