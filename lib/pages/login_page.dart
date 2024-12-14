import 'package:flutter/material.dart';
import 'package:footware_client/pages/register_page.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.blueGrey[50]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome Back!",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.deepPurple),
          ),
          Gap(20),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.phone_android),
                labelText: "Mobile Number",
                hintText: "Enter your mobile number"),
          ),
          Gap(20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple),
              onPressed: () {},
              child: Text("Login")),
          TextButton(
              onPressed: () {
                RegisterPage();
              },
              child: Text("Register new account"))
        ],
      ),
    ));
  }
}
