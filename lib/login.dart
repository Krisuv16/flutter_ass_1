import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          hintText: "Enter Email"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          hintText: "Enter Password"),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Login"))
                ],
              ))
        ],
      ),
    );
  }
}
