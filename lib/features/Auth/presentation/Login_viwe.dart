import 'package:flowerio_app/features/Auth/presentation/widgets/Login_body.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return LogInBody();
  }
}
