
import 'dart:convert';

import 'package:flutter/material.dart';

import '../components/app_text_field.dart';
import '../config/app_route.dart';
import 'package:http/http.dart' as http;

const baseUrl="http://10.0.2.2:8080";

class ResetPassword extends StatelessWidget {
  final String resetPasswordRoute="$baseUrl/user/reset_password";
  final TextEditingController telController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Bienvenu sur Morivo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Inscrivez vous, pour continuer !",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Centers the row horizontally
              children: [
                Expanded(
                  child: AppTextField(
                    controller: telController,
                    hint: "Numéro Du télephone",
                    icon: "assets/svg/mobile-phone.svg",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Centers the row horizontally
              children: [
                Expanded(
                  child: AppTextField(
                    controller: password1Controller,
                    hint: "Mot de passe",
                    icon: "assets/svg/password-icon.svg",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Centers the row horizontally
              children: [
                Expanded(
                  child: AppTextField(
                    controller: password2Controller,
                    hint: "Retapez votre mot de passe",
                    icon: "assets/svg/password-icon.svg",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),

            SizedBox(height: 32,),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(onPressed: (){
                resetPassword();
                Navigator.of(context).pushNamed(AppRoute.clientPage);
              },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )
                  ),
                  child: Text("Envoyer")),
            ),

          ],
        ),

      ),
    );
  }
  Future<Map<String, dynamic>> resetPassword() async {
    final body={
      'tel': telController.text,
      'password': password1Controller.text,
    };
    final response = await http.post(
      Uri.parse(resetPasswordRoute),
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      // Parse response to JSON
      Map<String, dynamic> user = json.decode(response.body) as Map<String, dynamic>;
      print("User object: $user");
      return user;
    } else {
      throw Exception('Failed to create account: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
