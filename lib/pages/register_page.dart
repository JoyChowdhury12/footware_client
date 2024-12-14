import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.phone_android),
                  labelText: "Your Name",
                  hintText: "Enter your name"),
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
                child: Text("Register")),
            TextButton(onPressed: () {}, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
