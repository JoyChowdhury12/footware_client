import 'package:flutter/material.dart';
import 'package:footware_client/controller/login_controller.dart';
import 'package:footware_client/pages/login_page.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create Your Account !!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.deepPurple),
              ),
              Gap(20),
              TextField(
                controller: ctrl.registerEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: "Email",
                    hintText: "Enter your email"),
              ),
              Gap(20),
              TextField(
                controller: ctrl.registerPasswordController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.password),
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
                        ctrl.signUp();
                      },
                      child: Text("Register")),
              TextButton(
                  onPressed: () {
                    Get.to(LoginPage());
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      );
    });
  }
}
