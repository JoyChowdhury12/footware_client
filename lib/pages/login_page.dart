import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.password_outlined),
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
                      child: Text("Login"),
                    ),
              Gap(5),
              ctrl.isSigning
                  ? CircularProgressIndicator(
                      color: Colors.deepPurple,
                    )
                  : InkWell(
                      onTap: () {
                        ctrl.signInWithGoogle();
                      },
                      child: Container(
                        height: 45,
                        width: 215,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(0, 3),
                                spreadRadius: 5),
                          ],
                        ),
                        // child: ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //       foregroundColor: Colors.white,
                        //       backgroundColor: Colors.deepPurple),
                        //   onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            Gap(10),
                            Text(
                              "Sign in with Google",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
              Gap(5),

              // ),
              RichText(
                text: TextSpan(
                  text: "Didn't have an account? ",
                  style: TextStyle(color: Colors.black), // Default style
                  children: [
                    WidgetSpan(
                      child: InkWell(
                        onTap: () {
                          Get.to(RegisterPage());
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.deepPurple, // Link color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("Didn't have an account?"),
              //     TextButton(
              //         onPressed: () {
              //           Get.to(RegisterPage());
              //         },
              //         child: Text("Register")),
              //   ],
              // )
            ],
          ),
        ));
      },
    );
  }
}
