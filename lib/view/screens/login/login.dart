import 'package:flutter/material.dart';
import 'package:quote_task/view/screens/home/home.dart';
import 'package:quote_task/view_model/data/local/shared_prefrence/shared_keys.dart';
import 'package:quote_task/view_model/data/local/shared_prefrence/shared_prefrence.dart';

import '../../component/text_field_custom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const CustomTextField(
              labelText: "Email",
            ),
            const SizedBox(height: 25),
            const CustomTextField(
              labelText: "Password",
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }), (route) => false);
                  LocalData.set(key: SharedKeys.isLogin, value: true);
                },
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
