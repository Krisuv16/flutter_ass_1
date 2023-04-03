import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/auth/login.dart';
import 'package:patientapp/patient/patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var d = const Duration(seconds: 1);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      if (token == null) {
        Future.delayed(
            d,
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage())));
      } else {
        Future.delayed(
            d,
            () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PatientPage())));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: CupertinoActivityIndicator(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
