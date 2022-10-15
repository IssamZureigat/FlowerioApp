import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'features/Auth/presentation/SignUp_view.dart';
// import 'features/splash/presentation/widgets/splash_View_body.dart';
import 'features/splash/splash_view.dart';
import 'firebase_options.dart';


Future<void> main() async {
  runApp(const FlowerioApp());


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

}
class FlowerioApp extends StatelessWidget {
  const FlowerioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
       routes: {
        "/SignUp": (context) => SignUp(),
      },
    );
    
  }
}
