
import 'dart:convert';

import 'package:delevery_app/components/app_text_field.dart';
import 'package:delevery_app/config/app_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl="http://10.0.2.2:8080";
class LoginPage extends StatelessWidget {

  final signUpRoute="$baseUrl/user/auth";
  final TextEditingController telcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // Ensures the container takes up all available width
        padding: const EdgeInsets.all(16.0),

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          // Centers content vertically
          crossAxisAlignment: CrossAxisAlignment.center,
          // Centers content horizontally
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
              "Connectez vous, pour continuer !",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20), // Adds spacing between text and row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Centers the row horizontally
              children: [
                Expanded(
                  child: AppTextField(
                    hint: "Numéro Du télephone",
                    icon: "assets/svg/mobile-phone.svg",
                    controller: telcontroller,
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
                    hint: "Mot de passe",
                    icon: "assets/svg/password-icon.svg",
                    controller: passwordcontroller,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: (){
                Navigator.of(context).pushNamed(AppRoute.resetPassword);
              },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Mot de passe oublié?')),
            ),
            SizedBox(height: 32,),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(onPressed: (){

                Navigator.of(context).pushReplacementNamed(AppRoute.clientPage);
                auth();
              },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )
                  ),
                  child: Text("Se connecter")),
            ),
            Row(
              children: [
                const Text("j'ai pas de compte?",style: TextStyle(
                  color: Colors.white,
                ),
                ),
                TextButton(onPressed: (){
                  Navigator.of(context).pushNamed(AppRoute.signUp);
                },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.amber
                    ),
                    child: const Text('Creer un compte',style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),))
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<Map<String, dynamic>> auth() async {
    final body={
      'tel': telcontroller.text,
      'password': passwordcontroller.text,
    };
    final response = await http.post(
      Uri.parse(signUpRoute),
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      // Parse response to JSON
      Map<String, dynamic> user = json.decode(response.body) as Map<String, dynamic>;
      print("User object: $user");
      return user;
    } else {
      throw Exception('Failed to connecte: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
