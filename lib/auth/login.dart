import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/config/api.const.dart';
import 'package:patientapp/patient/patient.dart';
import 'package:patientapp/utils/dialog_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final dio = Dio();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextEditingController =
      TextEditingController();

  final TextEditingController _passowrdTextEditingController =
      TextEditingController();

  Future onLogin(String username, String password, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance().whenComplete(
        () => DialogUtils.showLoadingDialog(context, dismissable: false));
    var data = {"username": username, "password": password};
    try {
      var url = base_url + login;
      var response = await dio.post(url,
          data: data,
          options: Options(contentType: "application/x-www-form-urlencoded"));
      if (response.statusCode == 200) {
        prefs.setString('token', response.data['accessToken']);
        return true;
      } else {
        Navigator.pop(context);
        return response.data['message'];
      }
    } catch (e) {
      Navigator.pop(context);
      print(e.toString());
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailTextEditingController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Email Address Required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "Enter Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passowrdTextEditingController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Password Required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Enter Password"),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        onLogin(_emailTextEditingController.text,
                                _passowrdTextEditingController.text, context)
                            .then((value) {
                          if (value) {
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const PatientPage()));
                          } else {
                            var snackBar = const SnackBar(
                              content: Text("Invalid Data"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      }
                    },
                    child: const Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
