import 'package:flutter/material.dart';
import 'package:footware_client/controller/login_controller.dart';
import 'package:footware_client/pages/home_page.dart';
import 'package:footware_client/pages/register_page.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (ctrl) {
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
                controller: ctrl.loginEmailController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: "Email",
                    hintText: "Enter your email address"),
              ),
              Gap(20),
              TextField(
                controller: ctrl.loginPasswordController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: "Password",
                    hintText: "Enter your password"),
              ),
              Gap(20),
              ctrl.isSigning
                  ? CircularProgressIndicator(
                      color: Colors.deepPurple,
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.deepPurple),
                      onPressed: () {
                        ctrl.signIn();
                      },
                      child: Text("Login")),
              TextButton(
                  onPressed: () {
                    Get.to(RegisterPage());
                  },
                  child: Text("Register new account"))
            ],
          ),
        ));
      },
    );
  }
}
