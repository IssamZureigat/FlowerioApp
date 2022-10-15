import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerio_app/core/constants.dart';
import 'package:flowerio_app/features/Auth/presentation/widgets/login_button.dart';
import 'package:flowerio_app/features/Auth/presentation/widgets/textfildes.dart';
// import 'package:flowerio_app/features/mainView/presentation/MainView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../mainView/presentation/widgets/MainView_body.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});
  @override
  State<LogInBody> createState() => _LogInBodyState();
}

TextEditingController Email = TextEditingController();
TextEditingController Password = TextEditingController();

class _LogInBodyState extends State<LogInBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Image.asset(
                "images/Logo.png",
                color: kMainColor,
                height: 200,
              ),
              const Text("Sign In",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              InputField(
                myController: Email,
                HintText: "Enter your email",
                Security: false,
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                myController: Password,
                HintText: "Enter your password",
                Security: true,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  const Text(
                    "create an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 132, 131, 131),
                    ),
                  ),

                  // main ضيف الروتس
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/SignUp");
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 132, 131, 131),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              LogInButton(
                onTap: () async {
                  
                  try {
                    var authentacationObject = FirebaseAuth.instance;
                    UserCredential User =
                        await authentacationObject.signInWithEmailAndPassword(
                      email: Email.text,
                      password: Password.text,
                    );

                    Get.to(MainViewBody());
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Incorrect password or email"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
