import 'package:cartoontv/features/apiCalling/view/pages/api_calling_screen.dart';
import 'package:cartoontv/features/form/view/pages/form_screen.dart';
import 'package:cartoontv/features/home/views/pages/home_screen.dart';
import 'package:cartoontv/features/start/view/widget/custom_button.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: 'View UI Desing',
                color: Colors.deepPurple, // optional
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                label: 'Api Calling Screen',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ApiCallingScreen()));
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                label: 'Form Submitting Screen',
                color: Colors.orange, // optional
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FormScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
