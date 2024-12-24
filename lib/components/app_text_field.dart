
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/app_colors.dart';


class AppTextField extends StatelessWidget {
  final String hint;
  final String? icon;
  final TextEditingController? controller;
  const AppTextField({super.key, required this.hint,this.icon,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0), // Adjust spacing as needed
          child: SvgPicture.asset(
            icon!, // Replace with your actual SVG file path
            height: 30, // Adjust icon height
            width: 30, // Adjust icon width
          ),
        ),
        hintText: hint,
        labelText: hint,
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        filled: true,
        fillColor: AppColors.fieldColor,
      ),
    );
  }
}

