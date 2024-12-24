
import 'dart:convert';

import 'package:delevery_app/config/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../components/app_text_field.dart';
import '../styles/app_colors.dart';

const baseUrl="http://10.0.2.2:8080";

class SignUp extends StatefulWidget {

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signUpRoute="$baseUrl/user";
  final TextEditingController nniController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final List<String> _options = ["Livreur", "Client", "Propriétaire"];
  String? _selectedOption;
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
                      controller: nniController,
                      hint: "NNI ou Passport",
                      icon: "assets/svg/id-icon.svg",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centers the row horizontally
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedOption,
                      hint: const Text(
                        "Sélectionnez une option",
                      ),
                      items: _options
                          .map((option) => DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        filled: true,
                        fillColor: AppColors.fieldColor,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10.0), // Adds space between icon and text
                          child: SizedBox(
                            width: 15, // Set the width of the icon
                            height: 15, // Set the height of the icon
                            child: SvgPicture.asset(
                              "assets/svg/list-icon.svg",
                              width: 15,  // Control the width of the icon here
                              height: 15, // Control the height of the icon here
                              fit: BoxFit.contain, // Ensures the icon scales proportionally
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32,),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(onPressed: (){
                  createAccount();
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
  Future<Map<String, dynamic>> createAccount() async {
    final body={
      'nni': nniController.text,
      'tel': telController.text,
      'password': password1Controller.text,
      'role': _selectedOption,
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
      throw Exception('Failed to create account: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
